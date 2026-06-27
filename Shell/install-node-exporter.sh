#!/usr/bin/env bash
# Installs Node Exporter and places the binary directly into /usr/local/bin
# Installation is a default configuration using systemd
# Usage: sudo bash install-node-exporter.sh
# https://prometheus.io/download/ has all of the links and versions, as well as other exporters
######################################################

set -euo pipefail
#
# Change these variables to install a different version
VERSION="1.10.2"
NAME="node_exporter-${VERSION}.linux-amd64"
TARFILE="${NAME}.tar.gz"
URL="https://github.com/prometheus/node_exporter/releases/download/v${VERSION}/${TARFILE}"

if [ "$(id -u)" -ne 0 ]; then
	echo "Please run as root or with sudo" >&2
	exit 1
fi


echo "Downloading $URL if the version isn't correct, check https://prometheus.io/download/"
wget -q --show-progress -O "$TARFILE" "$URL"

# Extract only the node_exporter binary into /usr/local/bin in one step
echo "Extracting node_exporter to /usr/local/bin"
tar --extract --gzip --file="$TARFILE" --strip-components=1 --wildcards --no-anchored -C /usr/local/bin '*/node_exporter'
chmod 0755 /usr/local/bin/node_exporter

# Create a dedicated user for Node Exporter if it doesn't exist
if ! id node_exporter >/dev/null 2>&1; then
	useradd -rs /bin/false node_exporter
fi

# Create systemd service
cat > /etc/systemd/system/node_exporter.service <<'EOF'
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable --now node_exporter

# Cleanup tarball
rm -f "$TARFILE"

echo "Node Exporter installation complete. Listening on port 9100 (if firewall allows)."