#!/bin/bash
# A wrapper for a playbook, so I don't have to remember the syntax
# Takes one parameter, the full path of the playbook to run

# The passwd.yaml vault is created in the current directory
# ansible-vault create passwd.yaml

# See /etc/ansible/hosts for the variables syntax and see the line below to call the vault
ansible-playbook -v  --ask-vault-pass --extra-vars '@passwd.yaml' $1 

