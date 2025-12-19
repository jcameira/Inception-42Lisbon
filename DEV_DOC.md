---

## 📄 `DEV_DOC.md`

```md
# Developer Documentation — Inception

This document is intended for developers maintaining or extending the Inception project.

## Prerequisites

- Linux OS (native or VM)
- Docker
- Docker Compose
- Make

## Project Structure

```text
.
├── Makefile
├── docker-compose.yml
├── srcs/
│   └── requirements/
│       ├── nginx/
│       │   ├── Dockerfile
│       │   └── conf/
│       ├── wordpress/
│       │   ├── Dockerfile
│       │   └── conf/
│       ├── mariadb/
│       │   ├── Dockerfile
│       │   └── conf/
│       ├── redis/
│       │   └── Dockerfile
│       └── adminer/
│           └── Dockerfile
├── secrets/
└── volumes/