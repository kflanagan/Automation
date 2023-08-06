# Getting started at home with Ansible

## Computers
- Linux on a computer with a a somewhat current proessor and at least 8GB of RAM and 512 GB of storage, 16GB is preferred.  These can be had for a little more than $200. [Fedora](https://fedoraproject.org/#editions)
    - Visual Studio code on the host computer [VSCode](https://code.visualstudio.com/docs/setup/linux)
    - [Virtualazition and VMM](https://docs.fedoraproject.org/en-US/quick-docs/getting-started-with-virtualization/)
    - Fedora Server VM
    - Fedora workstaion VM
    - Ubuntu workstation VM


## Software on each
- All
  - openssh-server
    ```
    -sudo dnf install -openssh-server
    -sudo systemctl enable sshd
    -sudo systemctl start sshd
- Fedora Server VM
  - ssh key
  ```
  -ssh-keygen --in this case, don't put a password on the key
  -ssh-copyid "other vm"
  ``` 
  - [Ansible Server](https://docs.ansible.com/ansible/2.9/installation_guide/intro_installation.html#installing-ansible-on-rhel-centos-or-fedora)
  - [Semaphore](https://docs.ansible-semaphore.com/administration-guide/installation)  -  Optional web interface 
- Workstation VMs
  - Nothing special is required, they are targets 