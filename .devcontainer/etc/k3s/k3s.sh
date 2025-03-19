#!/bin/bash
# https://github.com/k3s-io/k3s/tree/master?tab=readme-ov-file#quick-start---install-script

# load helper functions
source /app/.devcontainer/etc/util/functions.sh

function k3s-install() {
  # Determine CPU Architecture
  arch=$(lscpu | grep "Architecture" | awk '{print $NF}')
  if [[ $arch == x86_64* ]]; then
    ARCH="amd64"
  elif  [[ $arch == aarch64 ]]; then
    ARCH="arm64"
  fi

  printInfoSection "CPU is $ARCH"

  printInfoSection "Ensure Docker Daemon is running (Dependency)"
  
  if pgrep -x "dockerd" >/dev/null
  then
    printInfo "Docker is running"
  else
    printInfo "Ensure Docker is running.."
    sudo bash /app/.devcontainer/etc/docker/docker.sh
  fi

  printInfoSection "Deleting K3s"
  sudo bash /usr/local/bin/k3s-uninstall.sh || true

  
  printInfoSection "Installing K3s"
  curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--write-kubeconfig-mode 644 --disable traefik" sh -

  # https://docs.k3s.io/cluster-access#accessing-the-cluster-from-outside-with-kubectl
  
  printInfoSection "Configure K3s Cluster access to user ubuntu"
  # Set kube config for root
  sudo mkdir -p /root/.kube
  sudo cp /etc/rancher/k3s/k3s.yaml /root/.kube/config
  # Set kube config for user ubuntu
  mkdir -p /home/ubuntu/.kube
  sudo cp /etc/rancher/k3s/k3s.yaml /home/ubuntu/.kube/config
  sudo chown -R ubuntu:ubuntu /home/ubuntu/.kube
  # Set kube config for external use in project_folder/.kube/config
  rm -rf /app/.kube
  mkdir -p /app/.kube
  sudo cp /etc/rancher/k3s/k3s.yaml /app/.kube/config
  sudo chmod 777 -R /app/.kube

  printInfoSection "Setting up NGINX Ingress"
  kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.2/deploy/static/provider/cloud/deploy.yaml
  
  # https://helm.sh/docs/intro/install/#from-script
  printInfoSection " Installing Helm"
  cd /tmp
  sudo curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
  sudo chmod 700 get_helm.sh
  sudo /tmp/get_helm.sh

  # https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/   
  printInfoSection " Installing Kubernetes dashboard"
   
  helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
  helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard
  

  # In the functions you can specify the amount of retries and the NS
  waitForAllPods
  printInfoSection " kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8001:443 --address=\"0.0.0.0\", (${attempts}/${max_attempts}) sleep 10s"
  kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8001:443 --address="0.0.0.0" > /dev/null 2>&1 &
  # https://github.com/komodorio/helm-dashboard
   
    printInfoSection "Installing Helm Dashboard"
   
  helm plugin install https://github.com/komodorio/helm-dashboard.git

   
  printInfoSection "Running Helm Dashboard" 
  helm dashboard --bind=0.0.0.0 --port 8002 --no-browser --no-analytics > /dev/null 2>&1 &

   
  printInfoSection "Helm version" 
  helm version

  # https://helm.sh/docs/intro/quickstart/#initialize-a-helm-chart-repository
  printInfoSection "Helm add Bitnami repo"
  printInfoSection "helm repo add bitnami https://charts.bitnami.com/bitnami" 
  helm repo add bitnami https://charts.bitnami.com/bitnami

   
  printInfoSection "Helm repo update" 
  helm repo update

   
  printInfoSection "Helm search repo bitnami"  
  helm search repo bitnami

   
  printInfoSection "Installing k8s CLI" 
  curl -sS https://webinstall.dev/k9s | bash

   
  printInfoSection "Create ServiceAccount and ClusterRoleBinding" 
  kubectl apply -f /app/.devcontainer/etc/k3s/dashboard-adminuser.yaml
  kubectl apply -f /app/.devcontainer/etc/k3s/dashboard-rolebind.yaml

   
  printInfoSection "Get admin-user token" 
  kubectl -n kube-system create token admin-user --duration=8760h

  if [[ $CODESPACES == true ]]; then
    KUBERNETES_DASHBOARD_URL="https://${CODESPACE_NAME}-8001.app.github.dev"
    HELM_DASHBOARD_URL="https://${CODESPACE_NAME}-8002.app.github.dev"
  else
    KUBERNETES_DASHBOARD_URL="https://localhost:8001"
    HELM_DASHBOARD_URL="http://localhost:8002"
  fi

  printInfoSection "Kubernetes Dashboard: ${KUBERNETES_DASHBOARD_URL} using the token above"
  printInfoSection "Helm Dashboard: ${HELM_DASHBOARD_URL}"

  # printInfoSection "Debug"
  # k3s check-config
}

k3s-install