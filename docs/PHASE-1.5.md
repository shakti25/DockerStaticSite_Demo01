# PHASE 1.5 – Public Exposure of Static Site on MicroK8s

## 1. Purpose of this Phase

Phase **1.5** is an intermediate step between **Phase 1 (Local workloads)** and **Phase 2 (Production-like exposure)**.

The goal is to:
- Deploy a **simple static website** to the MicroK8s cluster
- Expose it **securely to the public internet**
- Use **real DNS + HTTPS**
- Keep complexity intentionally low

This phase establishes a **solid baseline** for all future applications.

---

## 2. Current Cluster Context

### Kubernetes Distribution
- **MicroK8s** (single-node cluster)

### Enabled Add-ons
- `dns` (CoreDNS)
- `ingress` (NGINX Ingress Controller)
- `cert-manager`
- `helm` / `helm3`
- `metrics-server`
- `hostpath-storage`

### Access & Tooling
- `kubectl` configured remotely (Windows PC)
- Headlamp connected to the cluster
- Public access via router port forwarding
- Firewall (UFW) configured

---

## 3. Target Application

### Repository
- GitHub: `DockerStaticSite_Demo01`

### Application Characteristics
- Static website
- Container image already built and published to **Docker Hub**
- No backend
- No database
- No secrets or config maps required

### Deployment Method
- Kubernetes manifests managed via **Helm charts**
- Deployment triggered via **GitHub Actions (workflow_dispatch)**

---

## 4. Desired End State

At the end of Phase 1.5:

- ✅ Static site is running in MicroK8s
- ✅ Application is deployed using Helm
- ✅ GitHub Actions can deploy to the cluster
- ✅ Application is reachable from the public internet
- ✅ A **custom domain (Namecheap)** resolves to the cluster
- ✅ HTTPS is enabled using **cert-manager + Let’s Encrypt**
- ✅ Traffic flows through **NGINX Ingress**

---

## 5. Networking & DNS Strategy

### DNS Provider
- **Azure DNS** (preferred for learning purposes)

### Domain Registrar
- **Namecheap**

### DNS Flow
1. Namecheap delegates DNS to Azure DNS
2. Azure DNS zone manages records
3. Public A record points to the homelab public IP
4. Router forwards ports 80/443 to MicroK8s node

---

## 6. HTTPS Strategy

- **cert-manager** with Let’s Encrypt
- Use **HTTP-01 challenge** via NGINX Ingress
- One certificate per hostname

---

## 7. Scope Boundaries (Explicitly Out of Scope)

To avoid overengineering, the following are **not included**:

- ❌ Vault / external secret managers
- ❌ OAuth / authentication
- ❌ Service mesh (Istio, Linkerd)
- ❌ Multi-node clusters
- ❌ Autoscaling (HPA, Karpenter)
- ❌ Observability stacks (Grafana, Loki, Otel)

These will be addressed in later phases.

---

## 8. High-Level Task Breakdown

### Infrastructure & Access
- [ ] Confirm ingress controller is functional
- [ ] Confirm cert-manager is functional
- [ ] Verify router port forwarding (80/443)

### DNS
- [ ] Create Azure DNS zone
- [ ] Delegate Namecheap nameservers to Azure
- [ ] Create A record for the application

### Kubernetes
- [ ] Review Helm chart structure
- [ ] Configure values for domain and ingress
- [ ] Deploy application via Helm

### CI/CD
- [ ] Create GitHub Actions workflow
- [ ] Store kubeconfig securely as GitHub secret
- [ ] Deploy via workflow_dispatch

### Validation
- [ ] HTTP access works
- [ ] HTTPS certificate issued
- [ ] HTTPS access works
- [ ] Redeploy via CI/CD works

---

## 9. Success Criteria

Phase 1.5 is considered complete when:

- The site loads at `https://<custom-domain>`
- Certificate is valid and trusted
- No manual kubectl commands are required for redeploys
- The setup can be reproduced for future projects

---

## 10. Next Phase Preview (Phase 2)

Once Phase 1.5 is complete, Phase 2 may include:

- Multiple applications
- Shared ingress patterns
- Observability (Prometheus, Grafana)
- Secrets management
- Horizontal scaling
- More advanced CI/CD patterns

---

**This document is intentionally stable and should be used as reference context for AI-assisted development (Copilot, ChatGPT, etc.)**

