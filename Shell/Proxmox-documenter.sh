#!/bin/bash

# Proxmox Configuration Documenter
# This script generates documentation for VMs and containers on a Proxmox host

OUTPUT_FILE="proxmox-config.md"

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

    # Get list of containers
    pct list | tail -n +2 | while read -r line; do
        ctid=$(echo $line | awk '{print $1}')
        if [[ -n "$ctid" && "$ctid" != "VMID" ]]; then
            get_ct_details $ctid
        fi
    done

    echo "## Host Disk Space Summary"
    echo ""
    df -h | while read -r line; do
        echo "- $line"
    done
    echo ""

} > "$OUTPUT_FILE"

echo "Documentation generated in $OUTPUT_FILE"
