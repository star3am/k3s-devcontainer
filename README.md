# K3s Dev Container

A Dev Container running K3s, Kubernetes Dashboard and Helm Dashboard with a bunch of other goodies for you to use. This will accelerate your Kubernetes Developer workflow, giving you instant access to Kubernetes in a Docker container. Using this Dev Container will give you a K3s Kubernetes installation in minutes. 

## Introduction

A "dev container" is a Docker container specifically configured to act as a fully functional development environment, allowing developers to work on a project with all necessary tools, dependencies, and settings pre-installed, regardless of their local machine setup, ensuring consistency across different environments and team members; essentially, it packages a complete development environment into a containerized format. 

K3s is a lightweight, open-source version of Kubernetes that's designed for resource-constrained environments. It's a certified distribution that's fully compatible with Kubernetes. 

![K3s Dev Container](./images/041-potion.png)

## Getting Started

This project can be run Locally using a Dev Container in VSCode or in a Dev Container on Github Codespaces 

[![Kubernetes in a Dev Container](images/youtube-image.png)](https://www.youtube.com/watch?v=3ya9w2m6CLo)

### Quick Start

Click the "`Open in Github Codespaces`" button below and past the two bash commands inside the container terminal

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/star3am/k3s-devcontainer?quickstart=1)
```bash
bash /app/.devcontainer/etc/docker/docker.sh
bash /app/.devcontainer/etc/k3s/k3s.sh
```

### Running K3s On the Internet in Github Codespaces

Create or login to your Github.com account

- Fork this repository https://github.com/star3am/k3s-devcontainer
- Click on Code -> Codespaces -> Create Codespace on main

<div align="center">
  <img src="images/github-project.png" alt="K3s Dev Container Github Project" width="85%">
  <p><em>K3s Dev Container Github Project</em></p>
</div>

<div align="center">
  <img src="images/github-project-new-codespace-on-main.png" alt="K3s Dev Container Github Project Create new Codespace" width="85%">
  <p><em>K3s Dev Container Github Project Create new Codespace</em></p>
</div>

<div align="center">
  <img src="images/github-project-new-codespace-on-main-opening.png" alt="K3s Dev Container Github Project Create new Codespace Opening" width="85%">
  <p><em>K3s Dev Container Github Project Create new Codespace Opening</em></p>
</div>

<div align="center">
  <img src="images/github-project-new-codespace-on-main-opened.png" alt="K3s Dev Container Github Project Create new Codespace Opened" width="85%">
  <p><em>K3s Dev Container Github Project Create new Codespace Opened</em></p>
</div>

<div align="center">
  <img src="images/github-project-codespace-docker.png" alt="K3s Dev Container Github Project Codespace Docker" width="85%">
  <p><em>K3s Dev Container Github Project Codespace Docker</em></p>
</div>

<div align="center">
  <img src="images/github-project-codespace-docker-done.png" alt="K3s Dev Container Github Project Codespace Docker done" width="85%">
  <p><em>K3s Dev Container Github Project Codespace Docker done</em></p>
</div>

<div align="center">
  <img src="images/github-project-codespace-docker-info.png" alt="K3s Dev Container Github Project Codespace Docker info" width="85%">
  <p><em>K3s Dev Container Github Project Codespace Docker info</em></p>
</div>

<div align="center">
  <img src="images/github-project-codespace-k3s.png" alt="K3s Dev Container Github Project Codespace K3s" width="85%">
  <p><em>K3s Dev Container Github Project Codespace K3s</em></p>
</div>

<div align="center">
  <img src="images/github-project-codespace-k3s-done.png" alt="K3s Dev Container Github Project Codespace K3s done" width="85%">
  <p><em>K3s Dev Container Github Project Codespace K3s done</em></p>
</div>

<div align="center">
  <img src="images/github-project-codespace-k3s-done-ports.png" alt="K3s Dev Container Github Project Codespace K3s done Ports" width="85%">
  <p><em>K3s Dev Container Github Project Codespace K3s done Ports</em></p>
</div>

<div align="center">
  <img src="images/github-project-codespace-k3s-kubernetes-dashboard-login.png" alt="K3s Dev Container Github Project Codespace K3s Kubernetes Dashboard Login" width="85%">
  <p><em>K3s Dev Container Github Project Codespace K3s Kubernetes Dashboard Login</em></p>
</div>

<div align="center">
  <img src="images/github-project-codespace-k3s-kubernetes-dashboard-select-all-namespaces.png" alt="K3s Dev Container Github Project Codespace K3s Kubernetes Dashboard Select All Namespaces" width="85%">
  <p><em>K3s Dev Container Github Project Codespace K3s Kubernetes Dashboard Select All Namespaces</em></p>
</div>

<div align="center">
  <img src="images/github-project-codespace-k3s-kubernetes-dashboard-home.png" alt="K3s Dev Container Github Project Codespace K3s Kubernetes Dashboard Home" width="85%">
  <p><em>K3s Dev Container Github Project Codespace K3s Kubernetes Dashboard Home</em></p>
</div>

<div align="center">
  <img src="images/github-project-codespace-k3s-helm-dashboard-home.png" alt="K3s Dev Container Github Project Codespace K3s Helm Dashboard Home" width="85%">
  <p><em>K3s Dev Container Github Project Codespace K3s Helm Dashboard Home</em></p>
</div>

### Running K3s Locally in a Dev Container using Visual Studio Code

Install the following dependencies

- Docker or Docker Desktop https://www.docker.com/products/docker-desktop/
- Windows Only should create a `.wslconfig` see WSL Config below
- Visual Studio Code https://code.visualstudio.com/download (with Remote development in Containers extension) https://code.visualstudio.com/docs/remote/containers-tutorial
- Clone this repository
- Now Open VSCode and Open this repository (See screenshot below)

<div align="center">
  <img src="images/download-and-install-docker-desktop.png" alt="Download and install Docker desktop" width="85%">
  <p><em>Download and install Docker desktop</em></p>
</div>

<div align="center">
  <img src="images/download-and-install-visual-studio-code.png" alt="Download and install Visual Studio Code" width="85%">
  <p><em>Download and install Visual Studio Code</em></p>
</div>

<div align="center">
  <img src="images/download-and-install-visual-studio-code-dev-containers-extension.png" alt="Download and install Visual Studio Code Dev Containers Extension" width="85%">
  <p><em>Download and install Visual Studio Code Dev Containers Extension</em></p>
</div>

<div align="center">
  <img src="images/visual-studio-code-open-project.png" alt="Visual Studio Code Open Project" width="85%">
  <p><em>Visual Studio Code Open Project</em></p>
</div>

<div align="center">
  <img src="images/visual-studio-code-project-devcontainer.png" alt="Visual Studio Code Project Dev Container" width="85%">
  <p><em>Visual Studio Code Project Dev Container</em></p>
</div>

<div align="center">
  <img src="images/vscode-project-devcontainer-docker.png" alt="K3s Dev Container VSCode Project Dev Container Docker" width="85%">
  <p><em>K3s Dev Container VSCode Project Dev Container Docker</em></p>
</div>

<div align="center">
  <img src="images/vscode-project-devcontainer-docker-done.png" alt="K3s Dev Container VSCode Project Dev Container Docker done" width="85%">
  <p><em>K3s Dev Container VSCode Project Dev Container Docker done</em></p>
</div>

<div align="center">
  <img src="images/vscode-project-devcontainer-docker-info.png" alt="K3s Dev Container VSCode Project Dev Container Docker info" width="85%">
  <p><em>K3s Dev Container VSCode Project Dev Container Docker info</em></p>
</div>

<div align="center">
  <img src="images/vscode-project-devcontainer-k3s.png" alt="K3s Dev Container VSCode Project Dev Container K3s" width="85%">
  <p><em>K3s Dev Container VSCode Project Dev Container K3s</em></p>
</div>

<div align="center">
  <img src="images/vscode-project-devcontainer-k3s-done.png" alt="K3s Dev Container VSCode Project Dev Container K3s done" width="85%">
  <p><em>K3s Dev Container VSCode Project Dev Container K3s done</em></p>
</div>

<div align="center">
  <img src="images/vscode-project-devcontainer-k3s-done-ports.png" alt="K3s Dev Container VSCode Project Dev Container K3s done Ports" width="85%">
  <p><em>K3s Dev Container VSCode Project Dev Container K3s done Ports</em></p>
</div>

<div align="center">
  <img src="images/vscode-project-devcontainer-k3s-kubernetes-dashboard-login.png" alt="K3s Dev Container VSCode Project Dev Container K3s Kubernetes Dashboard Login" width="85%">
  <p><em>K3s Dev Container VSCode Project Dev Container K3s Kubernetes Dashboard Login</em></p>
</div>

<div align="center">
  <img src="images/vscode-project-devcontainer-k3s-kubernetes-dashboard-select-all-namespaces.png" alt="K3s Dev Container VSCode Project Dev Container K3s Kubernetes Dashboard Select All Namespaces" width="85%">
  <p><em>K3s Dev Container VSCode Project Dev Container K3s Kubernetes Dashboard Select All Namespaces</em></p>
</div>

<div align="center">
  <img src="images/vscode-project-devcontainer-k3s-kubernetes-dashboard-home.png" alt="K3s Dev Container VSCode Project Dev Container K3s Kubernetes Dashboard Home" width="85%">
  <p><em>K3s Dev Container VSCode Project Dev Container K3s Kubernetes Dashboard Home</em></p>
</div>

<div align="center">
  <img src="images/vscode-project-devcontainer-k3s-helm-dashboard-home.png" alt="K3s Dev Container VSCode Project Dev Container K3s Helm Dashboard Home" width="85%">
  <p><em>K3s Dev Container VSCode Project Dev Container K3s Helm Dashboard Home</em></p>
</div>

### WSL Config

Place the `.wslconfig` file inside your Windows user home directory, typically, `C:\Users\YOUR_USER\.wslconfig`
Restart WSL with `wsl --shutdown` and start WSL again with `wsl` in an Administrator Powershell terminal.

```
# After updating this file run wsl --update
# Settings apply across all Linux distros running on WSL 2
[wsl2]

# Limits VM memory to use no more than 8 GB, this can be set as whole numbers using GB or MB
memory=8GB

# Sets the VM to use 8 virtual processors
processors=8

# Force Cgroup Version: 2
kernelCommandLine = cgroup_no_v1=all

# https://learn.microsoft.com/en-us/windows/wsl/wsl-config
networkingMode=mirrored

# Sets amount of swap storage space to 8GB, default is 25% of available RAM
swap=8GB

# Sets swapfile path location, default is %USERPROFILE%\AppData\Local\Temp\swap.vhdx
swapfile=C:\\temp\\wsl-swap.vhdx

# Disable page reporting so WSL retains all allocated memory claimed from Windows and releases none back when free
pageReporting=false

# Turn on default connection to bind WSL 2 localhost to Windows localhost. Setting is ignored when networkingMode=mirrored
localhostforwarding=true

# Disables nested virtualization
nestedVirtualization=false

# Turns on output console showing contents of dmesg when opening a WSL 2 distro for debugging
debugConsole=false

# Enable experimental features
[experimental]
sparseVhd=true
autoMemoryReclaim=dropcache # testing supposed to help WSL recover after laptops hibernated
```

## Supported Architectures

| Name      | Codespace  |
|:--------- |:----------:|
| amd64     | ✓          |
| arm64     | ✓          |
| linux     | ✓          |
| windows   | ✓          |
| mac intel | ✓          |
| mac apple | ✓          |

## Connecting Externally

You can install kubectl on your laptop and connect to the K3s cluster using the Kube config file set in the .kube directory in the project folder. 

`kubectl get ns --kubeconfig=.kube/config`
```
NAME                   STATUS   AGE
default                Active   5m25s
kube-node-lease        Active   5m25s
kube-public            Active   5m25s
kube-system            Active   5m25s
kubernetes-dashboard   Active   5m15s
```

`kubectl get pods -n kube-system --kubeconfig=.kube/config`
```
NAME                                      READY   STATUS      RESTARTS   AGE
coredns-ccb96694c-f76tc                   1/1     Running     0          6m19s
helm-install-traefik-brtbd                0/1     Completed   1          6m19s
helm-install-traefik-crd-5nfpn            0/1     Completed   0          6m19s
local-path-provisioner-5b5f758bcf-wmmg6   1/1     Running     0          6m19s
metrics-server-7bf7d58749-jdpcm           1/1     Running     0          6m19s
svclb-traefik-3c9a52b4-h5m4m              2/2     Running     0          5m38s
traefik-5cbdcf97f4-fgc4l                  1/1     Running     0          5m38s
```

## Inspiration 

This project was inspired by HashiQube - The Ultimate DevOps Lab in a Docker container, https://hashiqube.com
