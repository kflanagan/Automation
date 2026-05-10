#!/bin/bash

set -euo pipefail

apt update && apt upgrade -y && apt autoremove -y

