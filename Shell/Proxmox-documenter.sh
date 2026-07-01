#!/bin/bash

# Proxmox Configuration Documenter
# This script generates documentation for VMs and containers on a Proxmox host


HOST_SHORTNAME=$(hostname -s)


#if the host is pve-mini use this value 
if [ "$HOST_SHORTNAME" == "pve-mini" ]; then
    OUTPUT_FILE="/data/code/Documents/proxmox-${HOST_SHORTNAME}.md"

#Another if for the host containing pavilion
elif [[ "$HOST_SHORTNAME" == *"pavilion"* ]]; then
    #Make sure that /code is mounted.
    if [ -d "/code/Documents" ]; then
        OUTPUT_FILE="/code/Documents/proxmox-${HOST_SHORTNAME}.md"
    else
        #mount -a if not mounted
       # mount -a
        #check again if /code/Documents exists
        if [ ! -d "/code/Documents" ]; then
        echo "Error: /code/Documents directory does not exist. Please ensure the filesystem is mounted."
        exit 1
    fi

# Function to decode URL-encoded strings
decode_url() {
    echo "$1" | sed 's/%0A/\n/g; s/%3A/:/g; s/%22/"/g; s/%27/'\''/g; s/%20/ /g; s/%3D/=/g; s/%26/&/g; s/%3F/?/g; s/%2B/+/g; s/%2C/,/g; s/%3B/;/g; s/%28/(/g; s/%29/)/g; s/%5B/[/g; s/%5D/]/g; s/%7B/{/g; s/%7D/}/g; s/%3C/</g; s/%3E/>/g; s/%23/#/g; s/%24/$/g; s/%25/%/g; s/%40/@/g; s/%5E/^/g; s/%60/`/g; s/%7C/|/g; s/%7E/~/g'
}

# Function to get VM details
get_vm_details() {
    local vmid=$1
    echo "## VM ID: $vmid"
    echo ""
    echo "### Configuration:"
    qm config $vmid | while IFS=': ' read -r key value; do
        if [[ "$key" == "description" ]]; then
            value=$(decode_url "$value")
        fi
        echo "- **$key**: $value"
    done
    echo ""
    echo "### Status:"
    qm status $vmid
    echo ""
    echo "### IP Addresses:"
    if qm status $vmid | grep -q running; then
        qm guest exec $vmid "ip addr show" 2>/dev/null | grep "inet " | grep -v "127.0.0.1" | awk '{print "- " $2}' | grep 192|| echo "- Unable to retrieve IP addresses (guest agent may not be installed)"
    else
        echo "- VM not running"
    fi
    echo ""
}

# Function to get Container details
get_ct_details() {
    local ctid=$1
    echo "## Container ID: $ctid"
    echo ""
    echo "### Configuration:"
    pct config $ctid | while IFS=': ' read -r key value; do
        if [[ "$key" == "description" ]]; then
            value=$(decode_url "$value")
        fi
        echo "- **$key**: $value"
    done
    echo ""
    echo "### Resources:"
    memory=$(pct config $ctid | grep "^memory" | awk '{print $2}')
    swap=$(pct config $ctid | grep "^swap" | awk '{print $2}')
    rootfs=$(pct config $ctid | grep "^rootfs" | awk -F',' '{print $1}' | cut -d' ' -f2)
    rootfssize=$(pct config $ctid | grep "^rootfs" | awk -F',' '{print $2}' | cut -d' ' -f2)
    diskfree=$(pct df $ctid | grep "rootfs" | awk '{print $6}')
    startup=$(pct config $ctid | grep "^startup" | awk '{print $2}')
    privileged=$(pct config $ctid | grep "^unprivileged" | awk '{print $2}')
    uptime=$(pct exec $ctid uptime 2>/dev/null | awk -F': ' '{print $1}' | cut -d',' -f1)
    if [[ "$privileged" == "1" ]]; then
        privileged_mode="Unprivileged"
    else
        privileged_mode="Privileged"
    fi
    echo "- **Memory**: ${memory}MB"
    echo "- **Swap**: ${swap}MB"
    echo "- **Disk (rootfs)**: $rootfs"
    echo "- **Disk Size (rootfs)**: $rootfssize"
    echo "- **Disk Free percentage (rootfs)**: $diskfree percent"
    echo "- **Startup**: $startup"
    echo "- **Privilege Mode**: $privileged_mode"
    echo "- **Uptime**: $uptime"
    echo ""
    echo "### Status:"
    pct status $ctid
    echo ""
    echo "### IP Addresses:"
    if pct status $ctid | grep -q running; then
        pct exec $ctid ip addr show 2>/dev/null | grep "inet " | grep -v "127.0.0.1" | awk '{print "- " $2}' | grep 192 || echo "- Unable to retrieve IP addresses"
    else
        echo "- Container not running"
    fi
    echo ""
}

# Start documentation
{
    echo "# Proxmox Configuration Documentation"
    echo "Generated on $(date)"
    echo ""
    
    echo "## Virtual Machines"
    echo ""
    
    # Get list of VMs
    qm list | tail -n +2 | while read -r line; do
        vmid=$(echo $line | awk '{print $1}')
        if [[ -n "$vmid" && "$vmid" != "VMID" ]]; then
            get_vm_details $vmid
        fi
    done
    
    echo "## Containers"
    echo ""
    
    # # Get list of containers
    # pct list | tail -n +2 | while read -r line; do
    #     ctid=$(echo $line | awk '{print $1}')
    #     if [[ -n "$ctid" && "$ctid" != "VMID" ]]; then
    #         get_ct_details $ctid
    #     fi
    # done
    
# Get list of containers
while IFS= read -r ctid; do
    if [[ -n "$ctid" && "$ctid" != "VMID" ]]; then
        get_ct_details "$ctid"
    fi
done < <(pct list | tail -n +2 | awk '{print $1}')

    echo "## Host Disk Space Summary"
    echo ""
    df -h | while read -r line; do
        echo "- $line"
    done
    echo ""
    
} > "$OUTPUT_FILE"

chmod 666 "$OUTPUT_FILE"
echo "Documentation generated in $OUTPUT_FILE"