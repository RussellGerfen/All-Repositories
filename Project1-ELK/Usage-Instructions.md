## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

[Network Diagram Link] https://github.com/RussellGerfen/Bootcamp-Projects/blob/e25bf262c173438e022b59deaa56e0c22eefdb82/Diagrams/Azure-Lab-Environment.png
![Network Diagram](Diagrams/Azure-Lab-Environment.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire 
deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.


This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration 
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly accessible, in addition to restricting traffic to the network.
Jump box helps automate the configuration process for other virtual machines.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log data and system files.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

|        Name          |       Function         |   IP Address   |  OS   |
|----------------------|------------------------|----------------|-------|
| Jump-Box-Provisioner | Gateway                | 40.83.187.81   | Linux |
| ELK-VM               | Search & Log Analytics | 20.124.124.26  | Linux |
| RedTeam-Web1         | DVWA Web Server        | 104.42.117.161 | Linux |
| RedTeam-Web2         | DVWA Web Server        | 104.42.117.161 | Linux |


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the LoadBalancer machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: 40.83.187.81

Machines within the network can only be accessed by Jump-Box-Provisioner: 40.83.187.81

A summary of the access policies in place can be found in the table below.

| Name                 | Publicly Accessible | Allowed IP Addresses |
|----------------------|---------------------|----------------------|
| Jump-Box-Provisioner | Yes                 | My-Personal-IP       |
| ELK-VM               | No                  | 40.83.187.81         |
| RedTeam-Web1         | No                  | 40.83.187.81         |
| RedTeam-Web2         | No                  | 40.83.187.81         |


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because... 
It is a simple set up, no special skills are required to use and configure machines with an Infastructor as Code file.

[elk script file] https://github.com/RussellGerfen/Bootcamp-Projects/blob/13a6bb5e1ec3f82f942e2bbdc53ec8c1ad630313/Ansible/install-elk.yml

The install Elk playbook implements the following tasks:

- Identifies Hosts/targets
- Installs Docker.io to be the container we are using.
- Installs python3-pip so machine doesn't have to find its own version to download.
- Increases virtual memory to ensure accessibility for machine space.
- Downloads and launches elk container
- Ensures service sarts on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Docker PS Output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
RedTeam-Web1   10.0.0.5
RedTeam-Web2   10.0.0.4

We have installed the following Beats on these machines:
Filebeat and Metricbeat.

These Beats allow us to collect the following information from each machine:

Filebeat: Collects log data. Shows events done on machines, how many visitors visited the site and the locations they are from and what errors they received.
Metricbeat: Collects metrics of system logs, and cpu usage.


### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat and metricbeat config and playbook files to Jump-Box-Provisioner.
- Update the config files to include Kibana and elastisearch host ip and port number.
- Run the playbook, and navigate to http://20.124.124.26:5601/app/kabana to check that the installation worked as expected.


