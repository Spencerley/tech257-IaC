# Kubernetes

- [Kubernetes](#kubernetes)
  - [What is Kubernetes?](#what-is-kubernetes)
  - [How to use Kubernetes?](#how-to-use-kubernetes)
  - [When to use Kubernetes?](#when-to-use-kubernetes)
  - [Why use Kubernetes?](#why-use-kubernetes)
  - [General Commands:](#general-commands)
  - [Deployment with K8's](#deployment-with-k8s)

## What is Kubernetes?

- Kubernetes is an open-source system designed to automate the deployment, scaling, and management of containerized applications. It groups containers (which are essentially self-contained units of software) that make up an application into logical units for easier management and discovery.

## How to use Kubernetes?

- Using Kubernetes involves a few key steps:
  - Containerize your application: Break down your application into individual containers.
  - Define deployment configurations: Tell Kubernetes how to run your containers (resources, replicas, environment variables).
  - Set up a Kubernetes cluster: This cluster consists of a master node that manages worker nodes, which run your containerized application.
  - Manage your deployments: Use Kubernetes commands or tools to deploy, scale, and manage your application.

## When to use Kubernetes?

- Kubernetes is ideal for scenarios where you have:
  - Microservices architecture: Applications built from independent, loosely coupled services.
  - Scalable deployments: Need to easily scale your application up or down based on demand.
  - Complex deployments: Managing multiple containers and configurations across environments.
  - Containerized applications: Leverage the benefits of containerization (portability, isolation).

## Why use Kubernetes?

- Here are some of the key benefits of using Kubernetes:
  - Automation: Automates deployment, scaling, and management tasks, saving time and effort.
  - Scalability: Easily scale your applications up or down to meet demand.
  - Portability: Run your applications consistently across different cloud platforms or on-premises infrastructure.
  - High availability: Kubernetes can automatically restart failed containers and reschedule them on healthy nodes.
  - Declarative configuration: Define desired application states, and Kubernetes handles the implementation.
  - Rich ecosystem: A large and rapidly growing ecosystem of tools and integrations for Kubernetes.

- If you're working with containerized applications and need a robust system for deployment, scaling, and management, Kubernetes is a powerful tool to consider.

## General Commands:
- `kubectl create -f app-deployment.yaml`
- `kubectl delete deploy nginx-deployment`
- `kubectl get svc`
- `kubectl get pods`
- `kubectl get deployment`

## Deployment with K8's
- You can use Kubernetes to deploy app instances and database instances in one cluster and link them.
- Once you have created files for the database deployment, database service, app deployment and app service you can combine them into one file: [Sparta App Deployment.](sparta-app-deployment/sparta-app-full-deployment.yaml)
- Then run `kubectl exec -it <pod name> -- node seeds/seed.js`
- Go to your `localhost:<nodePort>` to test it works.