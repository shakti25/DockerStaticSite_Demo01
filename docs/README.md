# Homelab MicroK8s – Static Site Deployment

## Overview
This repository is used as a **learning and experimentation environment** for Docker and Kubernetes using a **self‑hosted MicroK8s cluster** running on a homelab Mini PC.

The primary goal of this project is to deploy a **publicly accessible static website** using Kubernetes best practices, while progressively introducing real‑world concepts such as:
- Helm-based deployments
- Ingress with NGINX
- DNS integration
- HTTPS with Let’s Encrypt
- GitHub Actions–based delivery

This repository intentionally keeps scope controlled and avoids unnecessary complexity in early phases.

---

## Cluster Environment

### Kubernetes Distribution
- **MicroK8s** (single-node cluster)
- Installed on Ubuntu Server LTS

### Enabled MicroK8s Add-ons
- `dns` – CoreDNS for internal cluster name resolution
- `ingress` – NGINX Ingress Controller for external access
- `cert-manager` – Automatic TLS certificate provisioning via Let’s Encrypt
- `helm / helm3` – Helm package manager support
- `hostpath-storage` – Default storage class (local disk)
- `metrics-server` – Resource metrics (CPU / memory)

### Networking
- Single-node cluster
- Node is exposed to the local network
- External access achieved via router port-forwarding

---

## Deployment Model

### Container Image
- The application image is **already built and published to Docker Hub**
- Kubernetes pulls the image directly from Docker Hub

### Kubernetes Resources
All Kubernetes resources are created using **Helm charts**, including:
- Deployment
- Service (ClusterIP)
- Ingress

### CI/CD
- **GitHub Actions** is used for deployment
- Deployment is triggered manually using `workflow_dispatch`
- The pipeline deploys Helm charts directly to the MicroK8s cluster

---

## External Access

### Ingress
- NGINX Ingress Controller is used
- Host-based routing (domain-based access)

### DNS
- Domain registrar: **Namecheap**
- DNS provider for this project: **Azure DNS**
- DNS records point to the public IP of the homelab router

### TLS / HTTPS
- HTTPS is provided using **cert-manager**
- Certificates are issued by **Let’s Encrypt**
- Certificates are automatically renewed

---

## Observability (Future Phases)
The following tools are **out of scope for the current phase**, but planned for later:
- Prometheus
- Grafana
- Loki
- OpenTelemetry
- K6
- Elasticsearch

---

## Out of Scope (Current Phase)
To keep the learning path focused, the following are **explicitly excluded** from this phase:
- Kubernetes Secrets
- ConfigMaps
- Autoscaling (HPA / VPA)
- Service Mesh (Istio)
- Multi-node clustering
- Vault or external secret managers

---

## Learning Objectives
This repository is intended to help practice:
- Docker image consumption (not image building)
- Helm chart structure and templating
- Kubernetes Ingress fundamentals
- DNS + TLS integration with Kubernetes
- Safe exposure of services from a homelab
- GitHub Actions interacting with a remote Kubernetes cluster

---

## Notes
- This cluster is **not production-grade**
- Security is intentionally minimal and incrementally improved
- All changes are validated manually before automation is expanded

---

## Next Step
See **PHASE-1.5.md** for the approved execution plan and task breakdown.

