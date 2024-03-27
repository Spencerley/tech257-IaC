# Terraform

## What is Terraform?

- Terraform is an open-source Infrastructure as Code (IaC) tool developed by HashiCorp. IaC means you define and manage your infrastructure using code, rather than manually configuring everything. Terraform uses a declarative language called HashiCorp Configuration Language (HCL) to describe the desired state of your infrastructure. You write code specifying what resources you need (like virtual machines, storage, databases), and Terraform figures out how to create or modify them to match your configuration.

## Why use Terraform?

### There are several advantages to using Terraform:

- Automation: Terraform automates infrastructure provisioning and management, saving time and reducing errors.
- Repeatability: You can easily recreate your infrastructure in different environments (e.g., development, staging, production) by simply running the same code.
- Version Control: Terraform configuration files can be stored in version control systems like Git, allowing you to track changes, collaborate with others, and roll back to previous versions if needed.
- Consistency: Terraform ensures consistent infrastructure across environments, reducing the risk of configuration drift.

### Benefits of Terraform:

- Improved Efficiency: Automating infrastructure management saves time and reduces manual work.
- Reduced Errors: Declarative configuration minimizes human error compared to manual configuration.
- Increased Reliability: Consistent infrastructure across environments leads to more reliable applications.
- Simplified Collaboration: Version control and code sharing enable easy collaboration between teams.

## Who is using Terraform?

### Terraform is a popular tool used by many companies across various industries. Here are some examples:

- Large Tech Companies: Many large tech companies like Netflix, Dropbox, and Uber leverage Terraform to manage their complex cloud infrastructure.
- Financial Services: Financial institutions use Terraform to ensure secure and compliant infrastructure for their applications.
- E-commerce Platforms: E-commerce companies rely on Terraform for scalable and reliable infrastructure to handle high traffic volumes.

## Orchestration with Terraform IaC

- Terraform itself isn't an orchestration tool, but it can be used alongside orchestration tools like Kubernetes. Terraform excels at provisioning and managing infrastructure resources, while Kubernetes focuses on managing containerized applications deployed on that infrastructure. They can work together to automate the entire infrastructure and application deployment process.

- For example, Terraform can create the virtual machines and network resources needed for a Kubernetes cluster. Then, Kubernetes can be deployed on those resources and used to manage containerized applications.

## Using terraform with AWS:
1. Install terraform and set the correct path in system env var.
2. Add AWS creds in User env var.
3. Write your provider then run `terraform init`
4. Write your resource then run `terraform plan`
5. It'll tell you if you can run `terraform apply`
6. .gitignore file very important not to push everything up.
7. Terminate instances with `terraform destroy`

## Configuration Management: 
- Pull and push. They differ in how the desired configuration state is delivered to the target systems:

### Pull-based Configuration Management:

- Concept: In a pull-based approach, a lightweight agent is installed on each managed system (node) in the infrastructure. This agent is responsible for:
    - Regularly pulling the desired configuration from a central server (configuration management server).
    - Comparing the pulled configuration with the current state of the system.
    - If there's a mismatch, the agent takes actions to bring the system's configuration in line with the desired state.
- Benefits:
    - Scalability: Well-suited for large deployments with many nodes, as the central server doesn't need to actively manage each system.
    - Self-healing: Nodes can automatically adjust their configuration based on changes in the central server.
    - Security: The central server only needs to expose the configuration files, not directly manage the nodes.
- Examples of Tools: Chef, Puppet, Ansible (by default with Ansible pull mode)

### Push-based Configuration Management:

- Concept: In a push-based approach, the central server takes a more active role in managing the configuration of the nodes. It initiates communication and pushes the desired configuration directly to the target systems.
- Process:
    - The administrator defines the desired configuration on the central server.
    - The server initiates a connection to each managed system using tools like SSH.
    - The server transfers the desired configuration files or executes commands on the target system to achieve the desired state.
- Benefits:
    - Simpler Setup: Can be easier to set up initially compared to pull-based tools.
    - Centralized Control: The central server has more direct control over the configuration of the nodes.
- Examples of Tools: Terraform, AWS CloudFormation, Ansible (can be configured for push mode)


### Choosing Between Pull and Push:
  
- The choice between pull and push approaches depends on your specific needs. Here's a general guideline:
    - Pull-based: Ideal for large, dynamic infrastructures where self-healing capabilities and scalability are important.
    - Push-based: Suitable for smaller, more static infrastructures or when you need more centralized control over configuration.

- Remember, some tools like Ansible offer flexibility and can be configured to work in either pull or push mode.

## Terraform Desired State vs. Current State

- Terraform operates based on the concept of desired state and current state. Here's a breakdown:
    - Desired State: This represents the infrastructure configuration you want to achieve. You define this state in your Terraform configuration files using HashiCorp Configuration Language (HCL). The configuration specifies the resources you need (e.g., virtual machines, storage buckets, databases) and their desired attributes (e.g., machine type, storage size, network configuration).
    - Current State: This refers to the actual state of your infrastructure resources in the cloud provider (e.g., AWS, Azure, GCP) that Terraform manages. Terraform keeps track of this information in a local state file by default, though remote backends like Terraform Cloud can also be used.

- Terraform's core functionality revolves around comparing these two states:
    - Plan: When you run terraform plan, Terraform analyzes your configuration files and compares them to the current state stored in the state file (or retrieved from the remote backend). It then generates a detailed execution plan outlining the actions it would take to create or modify resources to match your desired state.
    - Apply: If you're satisfied with the plan, running terraform apply instructs Terraform to execute the planned actions on the cloud provider. This brings the actual infrastructure (current state) in line with your desired state as defined in the configuration files.

- Essentially, Terraform acts as a bridge between your desired infrastructure configuration and the actual state in the cloud provider. It helps you automate the process of creating, modifying, and destroying infrastructure resources to achieve and maintain the desired state.

 - By understanding the distinction between desired and current state, you can effectively leverage Terraform to manage your infrastructure as code.