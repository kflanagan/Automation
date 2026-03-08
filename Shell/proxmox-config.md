# Proxmox Configuration Documentation
Generated on Thu Mar  5 08:20:43 PM EST 2026

## Virtual Machines

## VM ID: 100

### Configuration:
- **agent**: 1
- **bios**: ovmf
- **boot**: order=scsi0
- **cipassword**: **********
- **ciupgrade**: 0
- **ciuser**: root
- **cores**: 2
- **description**: <div align='center'>
  <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>
  </a>

  <h2 style='font-size: 24px; margin: 20px 0;'>ubuntu VM</h2>

  <p style='margin: 16px 0;'>
    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>
      <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />
    </a>
  </p>
  
  <span style='margin: 0 10px;'>
    <i class="fa fa-github fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-comments fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-exclamation-circle fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>
  </span>
</div>
- **efidisk0**: local-lvm:vm-100-disk-0,efitype=4m,size=4M
- **ide2**: local-lvm:vm-100-cloudinit,media=cdrom
- **ipconfig0**: ip=dhcp,ip6=dhcp
- **localtime**: 1
- **memory**: 7168
- **meta**: creation-qemu=10.0.2,ctime=1754615694
- **name**: ubuntu-vm
- **net0**: virtio=02:A8:4F:D2:5C:FF,bridge=vmbr0
- **onboot**: 1
- **ostype**: l26
- **scsi0**: local-lvm:vm-100-disk-1,discard=on,size=30G,ssd=1
- **scsihw**: virtio-scsi-pci
- **serial0**: socket
- **smbios1**: uuid=836c7e9c-d0e0-41ad-9193-7a395fd1492c
- **startup**: order=1
- **tablet**: 0
- **tags**: community-script
- **usb0**: host=174c:55aa
- **virtio2**: /dev/disk/by-id/ata-TEAM_T2532TB_TPBF2412230030200230,backup=0,size=2000398680K
- **vmgenid**: 195d7992-f916-4f36-bfef-8ba336cb1f7e

### Status:
status: running

### IP Addresses:
- Unable to retrieve IP addresses (guest agent may not be installed)

## VM ID: 105

### Configuration:
- **agent**: 1
- **bios**: ovmf
- **boot**: order=scsi0
- **cores**: 2
- **cpu**: host
- **description**: <div align='center'>
  <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>
  </a>

  <h2 style='font-size: 24px; margin: 20px 0;'>Homeassistant OS VM</h2>

  <p style='margin: 16px 0;'>
    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>
      <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />
    </a>
  </p>

  <span style='margin: 0 10px;'>
    <i class="fa fa-github fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-comments fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-exclamation-circle fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>
  </span>
</div>
- **efidisk0**: local-lvm:vm-105-disk-0,efitype=4m,size=4M
- **localtime**: 1
- **memory**: 6650
- **meta**: creation-qemu=10.0.2,ctime=1754768549
- **name**: haos
- **net0**: virtio=02:BE:52:EE:C5:82,bridge=vmbr0
- **onboot**: 1
- **ostype**: l26
- **scsi0**: local-lvm:vm-105-disk-1,cache=writethrough,discard=on,size=40G,ssd=1
- **scsihw**: virtio-scsi-pci
- **smbios1**: uuid=8d79f5dc-52b4-4a85-b7cc-dc4501587df3
- **startup**: order=2,up=20
- **tablet**: 0
- **tags**: community-script
- **usb0**: host=1-1
- **usb1**: host=5-1
- **usb2**: host=1-12
- **vmgenid**: e57a31fc-1afc-4da2-8a60-a2b61ae1bb74

### Status:
status: running

### IP Addresses:
- Unable to retrieve IP addresses (guest agent may not be installed)

## Containers

## Container ID: 101

### Configuration:
- **arch**: amd64
- **cores**: 1
- **description**: <div align='center'>
  <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>
  </a>

  <h2 style='font-size: 24px; margin: 20px 0;'>Pihole LXC</h2>

  <p style='margin: 16px 0;'>
    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>
      <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />
    </a>
  </p>

  <span style='margin: 0 10px;'>
    <i class="fa fa-github fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-comments fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-exclamation-circle fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>
  </span>
</div>
- **features**: keyctl=1,nesting=1,fuse=1
- **hostname**: pihole
- **memory**: 512
- **net0**: name=eth0,bridge=vmbr0,hwaddr=BC:24:11:75:83:EE,ip=dhcp,type=veth
- **onboot**: 1
- **ostype**: debian
- **rootfs**: local-lvm:vm-101-disk-0,size=5G
- **startup**: order=6
- **swap**: 512
- **tags**: adblock;community-script
- **unprivileged**: 1
- **lxc.cgroup2.devices.allow**: c 10:200 rwm
- **lxc.mount.entry**: /dev/net/tun dev/net/tun none bind,create=file

### Status:
status: running

### IP Addresses:
- 192.168.1.248/24

## Container ID: 102

### Configuration:
- **arch**: amd64
- **cores**: 1
- **description**: <div align='center'>
  <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>
  </a>

  <h2 style='font-size: 24px; margin: 20px 0;'>Excalidraw LXC</h2>

  <p style='margin: 16px 0;'>
    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>
      <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />
    </a>
  </p>

  <span style='margin: 0 10px;'>
    <i class="fa fa-github fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-comments fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-exclamation-circle fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>
  </span>
</div>
- **features**: nesting=1,fuse=1
- **hostname**: excalidraw
- **memory**: 3072
- **net0**: name=eth0,bridge=vmbr0,hwaddr=BC:24:11:97:BD:11,ip=dhcp,ip6=auto,type=veth
- **onboot**: 1
- **ostype**: debian
- **rootfs**: local-lvm:vm-102-disk-0,size=10G
- **startup**: order=5
- **swap**: 768
- **tags**: community-script;tailscale
- **lxc.cgroup2.devices.allow**: a
- **lxc.cap.drop**: 
- **lxc.cgroup2.devices.allow**: c 188:* rwm
- **lxc.cgroup2.devices.allow**: c 189:* rwm
- **lxc.mount.entry**: /dev/serial/by-id  dev/serial/by-id  none bind,optional,create=dir
- **lxc.mount.entry**: /dev/ttyUSB0       dev/ttyUSB0       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyUSB1       dev/ttyUSB1       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyACM0       dev/ttyACM0       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyACM1       dev/ttyACM1       none bind,optional,create=file
- **lxc.cgroup2.devices.allow**: c 226:128 rwm
- **lxc.mount.entry**: /dev/dri/renderD128 dev/dri/renderD128 none bind,optional,create=file
- **lxc.cgroup2.devices.allow**: c 29:0 rwm
- **lxc.mount.entry**: /dev/fb0 dev/fb0 none bind,optional,create=file
- **lxc.mount.entry**: /dev/dri dev/dri none bind,optional,create=dir
- **lxc.cgroup2.devices.allow**: c 10:200 rwm
- **lxc.mount.entry**: /dev/net/tun dev/net/tun none bind,create=file

### Status:
status: running

### IP Addresses:
- 192.168.1.154/24

## Container ID: 103

### Configuration:
- **arch**: amd64
- **cores**: 2
- **description**: <div align='center'>
  <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>
  </a>

  <h2 style='font-size: 24px; margin: 20px 0;'>audiobookshelf LXC</h2>

  <p style='margin: 16px 0;'>
    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>
      <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />
    </a>
  </p>

  <span style='margin: 0 10px;'>
    <i class="fa fa-github fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-comments fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-exclamation-circle fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>
  </span>
</div>
- **features**: nesting=1
- **hostname**: audiobookshelf
- **memory**: 2048
- **net0**: name=eth0,bridge=vmbr0,hwaddr=BC:24:11:4D:D9:51,ip=dhcp,ip6=auto,type=veth
- **onboot**: 1
- **ostype**: debian
- **rootfs**: local-lvm:vm-103-disk-0,size=4G
- **startup**: order=4,up=20
- **swap**: 512
- **tags**: audiobook;community-script;podcast;tailscale
- **lxc.cgroup2.devices.allow**: a
- **lxc.cap.drop**: 
- **lxc.cgroup2.devices.allow**: c 188:* rwm
- **lxc.cgroup2.devices.allow**: c 189:* rwm
- **lxc.mount.entry**: /dev/serial/by-id  dev/serial/by-id  none bind,optional,create=dir
- **lxc.mount.entry**: /dev/ttyUSB0       dev/ttyUSB0       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyUSB1       dev/ttyUSB1       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyACM0       dev/ttyACM0       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyACM1       dev/ttyACM1       none bind,optional,create=file
- **lxc.cgroup2.devices.allow**: c 226:128 rwm
- **lxc.mount.entry**: /dev/dri/renderD128 dev/dri/renderD128 none bind,optional,create=file
- **lxc.cgroup2.devices.allow**: c 29:0 rwm
- **lxc.mount.entry**: /dev/fb0 dev/fb0 none bind,optional,create=file
- **lxc.mount.entry**: /dev/dri dev/dri none bind,optional,create=dir
- **lxc.cgroup2.devices.allow**: c 10:200 rwm
- **lxc.mount.entry**: /dev/net/tun dev/net/tun none bind,create=file

### Status:
status: running

### IP Addresses:
- 192.168.1.180/24

## Container ID: 104

### Configuration:
- **arch**: amd64
- **cores**: 2
- **description**: <div align='center'>
  <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>
  </a>

  <h2 style='font-size: 24px; margin: 20px 0;'>Jellyfin LXC</h2>

  <p style='margin: 16px 0;'>
    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>
      <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />
    </a>
  </p>

  <span style='margin: 0 10px;'>
    <i class="fa fa-github fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-comments fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-exclamation-circle fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>
  </span>
</div>
- **features**: nesting=1,fuse=1
- **hostname**: jellyfin
- **memory**: 2048
- **net0**: name=eth0,bridge=vmbr0,hwaddr=BC:24:11:30:2D:33,ip=dhcp,ip6=auto,type=veth
- **onboot**: 1
- **ostype**: ubuntu
- **rootfs**: local-lvm:vm-104-disk-0,size=8G
- **startup**: order=3,up=30
- **swap**: 512
- **tags**: community-script;media;tailscale
- **lxc.cgroup2.devices.allow**: a
- **lxc.cap.drop**: 
- **lxc.cgroup2.devices.allow**: c 188:* rwm
- **lxc.cgroup2.devices.allow**: c 189:* rwm
- **lxc.mount.entry**: /dev/serial/by-id  dev/serial/by-id  none bind,optional,create=dir
- **lxc.mount.entry**: /dev/ttyUSB0       dev/ttyUSB0       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyUSB1       dev/ttyUSB1       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyACM0       dev/ttyACM0       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyACM1       dev/ttyACM1       none bind,optional,create=file
- **lxc.cgroup2.devices.allow**: c 226:128 rwm
- **lxc.mount.entry**: /dev/dri/renderD128 dev/dri/renderD128 none bind,optional,create=file
- **lxc.cgroup2.devices.allow**: c 29:0 rwm
- **lxc.mount.entry**: /dev/fb0 dev/fb0 none bind,optional,create=file
- **lxc.mount.entry**: /dev/dri dev/dri none bind,optional,create=dir
- **lxc.cgroup2.devices.allow**: c 10:200 rwm
- **lxc.mount.entry**: /dev/net/tun dev/net/tun none bind,create=file

### Status:
status: running

### IP Addresses:
- 192.168.1.203/24

## Container ID: 106

### Configuration:
- **arch**: amd64
- **cores**: 2
- **description**: <div align='center'>
  <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>
  </a>

  <h2 style='font-size: 24px; margin: 20px 0;'>Stirling-PDF LXC</h2>

  <p style='margin: 16px 0;'>
    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>
      <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />
    </a>
  </p>

  <span style='margin: 0 10px;'>
    <i class="fa fa-github fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-comments fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-exclamation-circle fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>
  </span>
</div>
- **features**: nesting=1
- **hostname**: stirling-pdf
- **memory**: 2048
- **net0**: name=eth0,bridge=vmbr0,hwaddr=BC:24:11:4D:0E:09,ip=dhcp,ip6=auto,type=veth
- **onboot**: 1
- **ostype**: debian
- **rootfs**: local-lvm:vm-106-disk-0,size=8G
- **swap**: 512
- **tags**: community-script;pdf-editor;tailscale
- **lxc.cgroup2.devices.allow**: a
- **lxc.cap.drop**: 
- **lxc.cgroup2.devices.allow**: c 188:* rwm
- **lxc.cgroup2.devices.allow**: c 189:* rwm
- **lxc.mount.entry**: /dev/serial/by-id  dev/serial/by-id  none bind,optional,create=dir
- **lxc.mount.entry**: /dev/ttyUSB0       dev/ttyUSB0       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyUSB1       dev/ttyUSB1       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyACM0       dev/ttyACM0       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyACM1       dev/ttyACM1       none bind,optional,create=file
- **lxc.cgroup2.devices.allow**: c 226:128 rwm
- **lxc.mount.entry**: /dev/dri/renderD128 dev/dri/renderD128 none bind,optional,create=file
- **lxc.cgroup2.devices.allow**: c 29:0 rwm
- **lxc.mount.entry**: /dev/fb0 dev/fb0 none bind,optional,create=file
- **lxc.mount.entry**: /dev/dri dev/dri none bind,optional,create=dir
- **lxc.cgroup2.devices.allow**: c 10:200 rwm
- **lxc.mount.entry**: /dev/net/tun dev/net/tun none bind,create=file

### Status:
status: running

### IP Addresses:
- 192.168.1.186/24

## Container ID: 107

### Configuration:
- **arch**: amd64
- **cores**: 1
- **description**: <div align='center'>
  <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>
  </a>

  <h2 style='font-size: 24px; margin: 20px 0;'>MeTube LXC</h2>

  <p style='margin: 16px 0;'>
    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>
      <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />
    </a>
  </p>

  <span style='margin: 0 10px;'>
    <i class="fa fa-github fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-comments fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-exclamation-circle fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>
  </span>
</div>
- **features**: nesting=1,fuse=1
- **hostname**: metube
- **memory**: 2048
- **net0**: name=eth0,bridge=vmbr0,hwaddr=BC:24:11:D4:B8:C0,ip=dhcp,ip6=auto,type=veth
- **onboot**: 1
- **ostype**: debian
- **rootfs**: local-lvm:vm-107-disk-0,size=15G
- **swap**: 512
- **tags**: community-script;media;youtube
- **unused0**: local-lvm:vm-107-disk-1
- **lxc.cgroup2.devices.allow**: a
- **lxc.cap.drop**: 
- **lxc.cgroup2.devices.allow**: c 188:* rwm
- **lxc.cgroup2.devices.allow**: c 189:* rwm
- **lxc.mount.entry**: /dev/serial/by-id  dev/serial/by-id  none bind,optional,create=dir
- **lxc.mount.entry**: /dev/ttyUSB0       dev/ttyUSB0       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyUSB1       dev/ttyUSB1       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyACM0       dev/ttyACM0       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyACM1       dev/ttyACM1       none bind,optional,create=file
- **lxc.cgroup2.devices.allow**: c 226:128 rwm
- **lxc.mount.entry**: /dev/dri/renderD128 dev/dri/renderD128 none bind,optional,create=file
- **lxc.cgroup2.devices.allow**: c 29:0 rwm
- **lxc.mount.entry**: /dev/fb0 dev/fb0 none bind,optional,create=file
- **lxc.mount.entry**: /dev/dri dev/dri none bind,optional,create=dir

### Status:
status: running

### IP Addresses:
- 192.168.1.157/24

## Container ID: 108

### Configuration:
- **arch**: amd64
- **cores**: 2
- **description**: <div align='center'>
  <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>
  </a>

  <h2 style='font-size: 24px; margin: 20px 0;'>Plex LXC</h2>

  <p style='margin: 16px 0;'>
    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>
      <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />
    </a>
  </p>

  <span style='margin: 0 10px;'>
    <i class="fa fa-github fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-comments fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-exclamation-circle fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>
  </span>
</div>
- **features**: nesting=1,fuse=1
- **hostname**: plex
- **memory**: 2048
- **net0**: name=eth0,bridge=vmbr0,hwaddr=BC:24:11:78:EC:9A,ip=dhcp,ip6=auto,type=veth
- **onboot**: 1
- **ostype**: ubuntu
- **rootfs**: local-lvm:vm-108-disk-0,size=10G
- **startup**: order=8
- **swap**: 512
- **tags**: community-script;media
- **lxc.cgroup2.devices.allow**: a
- **lxc.cap.drop**: 
- **lxc.cgroup2.devices.allow**: c 188:* rwm
- **lxc.cgroup2.devices.allow**: c 189:* rwm
- **lxc.mount.entry**: /dev/serial/by-id  dev/serial/by-id  none bind,optional,create=dir
- **lxc.mount.entry**: /dev/ttyUSB0       dev/ttyUSB0       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyUSB1       dev/ttyUSB1       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyACM0       dev/ttyACM0       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyACM1       dev/ttyACM1       none bind,optional,create=file
- **lxc.cgroup2.devices.allow**: c 226:128 rwm
- **lxc.mount.entry**: /dev/dri/renderD128 dev/dri/renderD128 none bind,optional,create=file
- **lxc.cgroup2.devices.allow**: c 29:0 rwm
- **lxc.mount.entry**: /dev/fb0 dev/fb0 none bind,optional,create=file
- **lxc.mount.entry**: /dev/dri dev/dri none bind,optional,create=dir

### Status:
status: running

### IP Addresses:
- 192.168.1.184/24

## Container ID: 109

### Configuration:
- **arch**: amd64
- **cores**: 2
- **description**: <div align='center'>
  <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>
  </a>

  <h2 style='font-size: 24px; margin: 20px 0;'>Transmission LXC</h2>

  <p style='margin: 16px 0;'>
    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>
      <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />
    </a>
  </p>

  <span style='margin: 0 10px;'>
    <i class="fa fa-github fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-comments fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-exclamation-circle fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>
  </span>
</div>
- **features**: nesting=1,fuse=1
- **hostname**: transmission
- **memory**: 2048
- **net0**: name=eth0,bridge=vmbr0,hwaddr=BC:24:11:82:49:64,ip=dhcp,ip6=auto,type=veth
- **onboot**: 1
- **ostype**: debian
- **rootfs**: local-lvm:vm-109-disk-0,size=12G
- **swap**: 512
- **tags**: community-script;torrent
- **lxc.cgroup2.devices.allow**: a
- **lxc.cap.drop**: 
- **lxc.cgroup2.devices.allow**: c 188:* rwm
- **lxc.cgroup2.devices.allow**: c 189:* rwm
- **lxc.mount.entry**: /dev/serial/by-id  dev/serial/by-id  none bind,optional,create=dir
- **lxc.mount.entry**: /dev/ttyUSB0       dev/ttyUSB0       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyUSB1       dev/ttyUSB1       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyACM0       dev/ttyACM0       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyACM1       dev/ttyACM1       none bind,optional,create=file
- **lxc.cgroup2.devices.allow**: c 226:128 rwm
- **lxc.mount.entry**: /dev/dri/renderD128 dev/dri/renderD128 none bind,optional,create=file
- **lxc.cgroup2.devices.allow**: c 29:0 rwm
- **lxc.mount.entry**: /dev/fb0 dev/fb0 none bind,optional,create=file
- **lxc.mount.entry**: /dev/dri dev/dri none bind,optional,create=dir

### Status:
status: running

### IP Addresses:
- 192.168.1.130/24

## Container ID: 110

### Configuration:
- **arch**: amd64
- **cores**: 2
- **description**: <div align='center'>
  <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>
  </a>

  <h2 style='font-size: 24px; margin: 20px 0;'>Podman LXC</h2>

  <p style='margin: 16px 0;'>
    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>
      <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />
    </a>
  </p>

  <span style='margin: 0 10px;'>
    <i class="fa fa-github fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-comments fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-exclamation-circle fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>
  </span>
</div>
- **features**: nesting=1
- **hostname**: podman
- **memory**: 4096
- **net0**: name=eth0,bridge=vmbr0,hwaddr=BC:24:11:75:95:DD,ip=dhcp,ip6=auto,type=veth
- **onboot**: 1
- **ostype**: debian
- **rootfs**: local-lvm:vm-110-disk-0,size=25G
- **swap**: 768
- **tags**: community-script;container;kubernetes;tailscale
- **lxc.cgroup2.devices.allow**: a
- **lxc.cap.drop**: 
- **lxc.cgroup2.devices.allow**: c 188:* rwm
- **lxc.cgroup2.devices.allow**: c 189:* rwm
- **lxc.mount.entry**: /dev/serial/by-id  dev/serial/by-id  none bind,optional,create=dir
- **lxc.mount.entry**: /dev/ttyUSB0       dev/ttyUSB0       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyUSB1       dev/ttyUSB1       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyACM0       dev/ttyACM0       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyACM1       dev/ttyACM1       none bind,optional,create=file
- **lxc.cgroup2.devices.allow**: c 226:128 rwm
- **lxc.mount.entry**: /dev/dri/renderD128 dev/dri/renderD128 none bind,optional,create=file
- **lxc.mount.entry**: /dev/dri dev/dri none bind,optional,create=dir
- **lxc.cgroup2.devices.allow**: c 10:200 rwm
- **lxc.mount.entry**: /dev/net/tun dev/net/tun none bind,create=file

### Status:
status: running

### IP Addresses:
- 192.168.1.131/24

## Container ID: 111

### Configuration:
- **arch**: amd64
- **cores**: 2
- **description**: <div align='center'>
  <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>
  </a>

  <h2 style='font-size: 24px; margin: 20px 0;'>Podman LXC</h2>

  <p style='margin: 16px 0;'>
    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>
      <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />
    </a>
  </p>

  <span style='margin: 0 10px;'>
    <i class="fa fa-github fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-comments fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-exclamation-circle fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>
  </span>
</div>
- **features**: nesting=1,keyctl=1
- **hostname**: iptv
- **memory**: 2048
- **net0**: name=eth0,bridge=vmbr0,hwaddr=BC:24:11:ED:F1:54,ip=dhcp,ip6=auto,type=veth
- **onboot**: 1
- **ostype**: debian
- **rootfs**: local-lvm:vm-111-disk-0,size=6G
- **swap**: 512
- **tags**: community-script;container;kubernetes
- **timezone**: America/New_York
- **unprivileged**: 1

### Status:
status: running

### IP Addresses:
- 192.168.1.119/24

## Container ID: 112

### Configuration:
- **arch**: amd64
- **cores**: 1
- **description**: <div align='center'>
  <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>
  </a>

  <h2 style='font-size: 24px; margin: 20px 0;'>Prometheus-PVE-Exporter LXC</h2>

  <p style='margin: 16px 0;'>
    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>
      <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />
    </a>
  </p>

  <span style='margin: 0 10px;'>
    <i class="fa fa-github fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-comments fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-exclamation-circle fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>
  </span>
</div>
- **features**: nesting=1,keyctl=1
- **hostname**: prometheus-pve-exporter
- **memory**: 512
- **net0**: name=eth0,bridge=vmbr0,hwaddr=BC:24:11:08:6B:33,ip=dhcp,ip6=auto,type=veth
- **onboot**: 1
- **ostype**: debian
- **rootfs**: local-lvm:vm-112-disk-0,size=3G
- **swap**: 512
- **tags**: community-script;monitoring
- **timezone**: America/New_York
- **unprivileged**: 1

### Status:
status: running

### IP Addresses:
- 192.168.1.81/24

## Container ID: 113

### Configuration:
- **arch**: amd64
- **cores**: 2
- **description**: <div align='center'>
  <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>
  </a>

  <h2 style='font-size: 24px; margin: 20px 0;'>n8n LXC</h2>

  <p style='margin: 16px 0;'>
    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>
      <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />
    </a>
  </p>

  <span style='margin: 0 10px;'>
    <i class="fa fa-github fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-comments fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-exclamation-circle fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>
  </span>
</div>
- **features**: nesting=1,fuse=1
- **hostname**: n8n
- **memory**: 2048
- **net0**: name=eth0,bridge=vmbr0,hwaddr=BC:24:11:F6:90:44,ip=dhcp,ip6=auto,type=veth
- **onboot**: 1
- **ostype**: debian
- **rootfs**: local-lvm:vm-113-disk-0,size=20G
- **swap**: 512
- **tags**: automation;community-script
- **timezone**: America/New_York
- **lxc.cgroup2.devices.allow**: a
- **lxc.cap.drop**: 
- **lxc.cgroup2.devices.allow**: c 188:* rwm
- **lxc.cgroup2.devices.allow**: c 189:* rwm
- **lxc.mount.entry**: /dev/serial/by-id  dev/serial/by-id  none bind,optional,create=dir
- **lxc.mount.entry**: /dev/ttyUSB0       dev/ttyUSB0       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyUSB1       dev/ttyUSB1       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyACM0       dev/ttyACM0       none bind,optional,create=file
- **lxc.mount.entry**: /dev/ttyACM1       dev/ttyACM1       none bind,optional,create=file
- **lxc.cgroup2.devices.allow**: c 10:200 rwm
- **lxc.mount.entry**: /dev/net/tun dev/net/tun none bind,create=file

### Status:
status: running

### IP Addresses:
- 192.168.1.108/24

## Container ID: 114

### Configuration:
- **arch**: amd64
- **cores**: 2
- **cpulimit**: 2
- **features**: nesting=1
- **hostname**: pulse
- **memory**: 1024
- **net0**: name=eth0,bridge=vmbr0,firewall=1,hwaddr=BC:24:11:69:F0:3E,ip=dhcp,type=veth
- **onboot**: 1
- **ostype**: debian
- **protection**: 0
- **rootfs**: local-lvm:vm-114-disk-0,size=4G
- **startup**: order=99
- **swap**: 256
- **tags**: tailscale
- **unprivileged**: 1
- **lxc.cgroup2.devices.allow**: c 10:200 rwm
- **lxc.mount.entry**: /dev/net/tun dev/net/tun none bind,create=file

### Status:
status: running

### IP Addresses:
- 192.168.1.18/24

## Container ID: 116

### Configuration:
- **arch**: amd64
- **cores**: 1
- **description**: <div align='center'>
  <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>
  </a>

  <h2 style='font-size: 24px; margin: 20px 0;'>Prometheus LXC</h2>

  <p style='margin: 16px 0;'>
    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>
      <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />
    </a>
  </p>

  <span style='margin: 0 10px;'>
    <i class="fa fa-github fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-comments fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-exclamation-circle fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>
  </span>
</div>
- **features**: nesting=1,keyctl=1
- **hostname**: prometheus
- **memory**: 2048
- **net0**: name=eth0,bridge=vmbr0,hwaddr=BC:24:11:56:24:D1,ip=dhcp,ip6=auto,type=veth
- **onboot**: 1
- **ostype**: debian
- **rootfs**: local-lvm:vm-116-disk-0,size=8G
- **swap**: 512
- **tags**: community-script;monitoring;tailscale
- **timezone**: America/New_York
- **unprivileged**: 1
- **lxc.cgroup2.devices.allow**: c 10:200 rwm
- **lxc.mount.entry**: /dev/net/tun dev/net/tun none bind,create=file

### Status:
status: running

### IP Addresses:
- 192.168.1.79/24

## Container ID: 117

### Configuration:
- **arch**: amd64
- **cores**: 1
- **description**: <div align='center'>
  <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/images/logo-81x112.png' alt='Logo' style='width:81px;height:112px;'/>
  </a>

  <h2 style='font-size: 24px; margin: 20px 0;'>Grafana LXC</h2>

  <p style='margin: 16px 0;'>
    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>
      <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />
    </a>
  </p>

  <span style='margin: 0 10px;'>
    <i class="fa fa-github fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-comments fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>
  </span>
  <span style='margin: 0 10px;'>
    <i class="fa fa-exclamation-circle fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>
  </span>
</div>
- **features**: nesting=1,keyctl=1
- **hostname**: grafana
- **memory**: 512
- **net0**: name=eth0,bridge=vmbr0,hwaddr=BC:24:11:C8:DA:7E,ip=dhcp,ip6=auto,type=veth
- **onboot**: 1
- **ostype**: debian
- **rootfs**: local-lvm:vm-117-disk-0,size=4G
- **swap**: 512
- **tags**: community-script;monitoring;tailscale;visualization
- **timezone**: America/New_York
- **unprivileged**: 1
- **lxc.cgroup2.devices.allow**: c 10:200 rwm
- **lxc.mount.entry**: /dev/net/tun dev/net/tun none bind,create=file

### Status:
status: running

### IP Addresses:
- 192.168.1.129/24

## Host Disk Space Summary

- Filesystem            Size  Used Avail Use% Mounted on
- udev                   16G     0   16G   0% /dev
- tmpfs                 3.1G  5.0M  3.1G   1% /run
- /dev/mapper/pve-root   94G   15G   75G  17% /
- tmpfs                  16G   34M   16G   1% /dev/shm
- efivarfs              128K   52K   72K  42% /sys/firmware/efi/efivars
- tmpfs                 5.0M     0  5.0M   0% /run/lock
- tmpfs                 1.0M     0  1.0M   0% /run/credentials/systemd-journald.service
- tmpfs                  16G   60K   16G   1% /tmp
- /dev/sda2            1022M  8.8M 1014M   1% /boot/efi
- /dev/fuse             128M   56K  128M   1% /etc/pve
- tmpfs                 1.0M     0  1.0M   0% /run/credentials/getty@tty1.service
- tmpfs                 3.1G  4.0K  3.1G   1% /run/user/0

