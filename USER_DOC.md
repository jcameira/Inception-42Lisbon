---

## 📄 `USER_DOC.md`

```md
# User Documentation — Inception

This document explains how to use the Inception infrastructure as an end user or system
administrator.

## Provided Services

The stack provides:
- **NGINX**: Secure HTTPS reverse proxy
- **WordPress**: Website and CMS
- **MariaDB**: Database backend
- **Redis**: Cache for WordPress
- **Adminer**: Database administration interface

## Starting the Project

Start all services using:
```bash
make build

This command:
- Builds Docker images if necessary
- Creates Docker volumes and networks
- Starts all containers in the correct order

## Accessing the Website

https://<your-domain-name>

## Networking
- All containers are connected to a custom Docker bridge network
- Only NGINX exposes ports to the host
- Containers communicate using Docker DNS and service names

This ensures strict isolation and controlled access.

## Data Persistence

Persistent data is stored in Docker volumes:
- WordPress files
- MariaDB database data

Volumes ensure:
- Data survives container restarts
- Containers remain stateless
- Infrastructure mimics real production setups

## Debugging and Maintenance
- Inspect logs to diagnose failures
- Verify network connectivity between services
- Rebuild images after configuration changes
- Never store credentials in Dockerfiles
- Never use the latest tag
- Keep containers single-purpose