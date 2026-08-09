#!/bin/bash
# This sets the LXC container to use Debian Trixie instead of Bookworm
sed -i 's/bookworm/trixie/g' /etc/apt/sources.list
apt update
apt dist-upgrade
