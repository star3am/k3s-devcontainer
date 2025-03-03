# K3s Dev Container

A Dev Container running K3s, Kubernetes Dashboard and Helm Dashboard with a bunch of other goodies for you to use. This will accelerate your Kubernetes Developer workflow. Using this Dev Container will giv eyou a K3s Kubernetes installation in minutes. 

## Introduction

A "dev container" is a Docker container specifically configured to act as a fully functional development environment, allowing developers to work on a project with all necessary tools, dependencies, and settings pre-installed, regardless of their local machine setup, ensuring consistency across different environments and team members; essentially, it packages a complete development environment into a containerized format. 

K3s is a lightweight, open-source version of Kubernetes that's designed for resource-constrained environments. It's a certified distribution that's fully compatible with Kubernetes. 

![K3s Dev Container](./images/041-potion.png)

## Getting Started

Install the following dependencies

- Docker or Docker Desktop https://www.docker.com/products/docker-desktop/
- Windows Only should create a `.wslconfig` see WSL Config below
- Visual Studio Code https://code.visualstudio.com/download (with Remote development in Containers extension) https://code.visualstudio.com/docs/remote/containers-tutorial
- Clone this repository
- Now Open VSCode and Open this repository (See screenshot below)

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