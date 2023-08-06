# Getting started at home with Ansible

## Computers
- Linux on a computer with a a somewhat current proessor and at least 8GB of RAM and 512 GB of storage, 16GB is preferred.  These can be had for a little more than $200. 
    - Visual Studio code on the host computer
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
  - Ansible Server
  - Semaphore --  Optional web interface
- Workstation VMs
  - Nothing special is required, they are targets 