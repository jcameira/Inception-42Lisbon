*This project has been created as part of the 42 curriculum by jcameira.*

# Inception

## Description

**Inception** is a system administration and DevOps project developed as part of the
42 curriculum. The objective of the project is to design, build, and deploy a complete,
secure, and persistent web infrastructure using **Docker** and **Docker Compose**,
while strictly following the project constraints.

The project is not about simply running containers. Its purpose is to demonstrate a
clear understanding of:
- Containerization principles
- Service isolation
- Secure networking
- Data persistence
- Configuration and secret management
- Production-oriented infrastructure design

All services are built from **custom Dockerfiles**, without using prebuilt service images,
and are orchestrated using Docker Compose on a Linux virtual machine.

## Architecture and Services

The infrastructure is composed of multiple independent services, each running inside
its own Docker container and connected through a dedicated Docker network.

### Mandatory Services

#### NGINX
- Acts as the **single entry point** to the infrastructure
- Handles **TLS termination**
- Accepts **HTTPS connections only**
- Proxies requests to the WordPress PHP-FPM container
- Is the only container exposing ports to the host system

#### WordPress (PHP-FPM)
- Runs the WordPress application logic
- Uses PHP-FPM without a built-in web server
- Communicates only with NGINX and MariaDB
- Does not expose any ports to the host

#### MariaDB
- Stores WordPress data
- Runs in an isolated container
- Is not accessible from outside the Docker network
- Uses persistent storage via Docker volumes

### Bonus Services

#### Redis
- Used as an object cache for WordPress
- Reduces the number of database queries
- Improves overall website performance

#### Adminer
- Lightweight web-based database administration tool
- Used to inspect and manage MariaDB
- Exposed through NGINX only

## Instructions

### Prerequisites

The project must be run on:
- A Linux system or Linux virtual machine
- Docker
- Docker Compose
- Make

### Installation

Clone the repository:
```bash
git clone https://github.com/jcameira/Inception-42Lisbon.git
cd Inception-42Lisbon
make build
```

## Docker vs Virtual Machines

### Virtual Machines
- Each VM runs a full operating system
- Higher memory and CPU usage
- Slower startup times
- Hardware-level isolation

### Docker
- Shares the host kernel
- Lightweight and fast
- Service-level isolation
- Ideal for microservice architectures

Docker is used because the project focuses on service orchestration and isolation
rather than full OS virtualization.

## Secrets vs Environment Variables

Environment variables are suitable for non-sensitive configuration but are unsafe for credentials.

Sensitive data such as:
- Database passwords
- WordPress administrator credentials

are handled using Docker secrets, which:
- Are not baked into Docker images
- Are not exposed in logs
- Are not committed to version control
- Are mounted at runtime only

## Docker Network vs Host Network

Using the host network would expose services directly on the host system and bypass Docker’s isolation mechanisms.

This project uses a custom Docker bridge network to:
- Isolate internal services
- Allow communication only where necessary
- Expose only NGINX to the host

## Docker Volumes vs Bind Mounts

### Bind Mounts
- Depend on host filesystem paths
- Less portable
- Prone to permission issues

### Docker Volumes
- Managed by Docker
- Portable across environments
- Safer and cleaner for production use

Docker volumes are used to persist:
- WordPress files
- MariaDB database data

## Resources
- Docker Documentation: https://docs.docker.com/
- Docker Compose Documentation: https://docs.docker.com/compose/
- NGINX Documentation: https://nginx.org/en/docs/
- WordPress Documentation: https://wordpress.org/support/
- MariaDB Documentation: https://mariadb.org/documentation/
- Redis Documentation: https://redis.io/documentation/
