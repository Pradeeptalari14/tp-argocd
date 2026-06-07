#!/usr/bin/env bash
set -euo pipefail
echo "🚀 Bootstrapping ArgoCD in Kubernetes Cluster..."
kubectl create namespace argocd || true
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
echo "Waiting for ArgoCD Server to be ready..."
kubectl rollout status deployment/argocd-server -n argocd --timeout=150s
echo "Applying SRE GitOps Application..."
kubectl apply -f argocd/application.yaml
echo "Done!"