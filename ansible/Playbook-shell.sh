#!/bin/bash
# A wrapper for a playbook, so I don't have to remember the syntax


ansible-playbook $1  --extra-vars 'ansible_become_pass=$2'


