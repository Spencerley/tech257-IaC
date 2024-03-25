# Ansible Controllers and Agents

![alt text](images/diagram-ansible.png)

## Ansible

- Run scripts called a playbook
- Need to learn YAML
    - Human readable
    - Anyone can learn it
    - Python dependencies uses Python in the background
- Benefits:
    - Agentless don’t need to install any software to run or write it locally, can just install and run on the master node.

1. Create 2x EC2 instances - one controller and one agent make sure they're open to port 22 so the controller can ssh into the agent.
2. On the controller run the following after the update and upgrade:
   - `sudo apt-get install software-properties-common`
   - `sudo apt-add-repository ppa:ansible/ansible`
   - in host file `ec2-instance ansible_host=3.255.121.145 ansible_user=ubuntu ansible_ssh_private_key_files=/.ssh/tech257.pem`
    - host has to be app agent ip
    - key files `<path to your private key>`
3. Add your agents IP to the hosts folder
    ![alt text](images/ip-structure.png)
4. Use the adhoc command to copy our ssh key from our controller to our agent:
    - `sudo ansible web -m ansible.builtin.copy -a "src=~/.ssh/tech257.pem dest=~/.ssh/"`
