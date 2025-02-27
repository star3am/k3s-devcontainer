#/bin/bash
# https://docs.docker.com/install/linux/docker-ce/ubuntu/

echo -e '\e[38;5;198m'"++++ "
echo -e '\e[38;5;198m'"Installing Docker Dependencies"
echo -e '\e[38;5;198m'"++++ "
sudo DEBIAN_FRONTEND=noninteractive apt-get update -qq < /dev/null > /dev/null
sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq --assume-yes apt-transport-https ca-certificates curl gnupg-agent software-properties-common < /dev/null > /dev/null
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

arch=$(lscpu | grep "Architecture" | awk '{print $NF}')
if [[ $arch == x86_64* ]]; then
  ARCH="amd64"
elif  [[ $arch == aarch64 ]]; then
  ARCH="arm64"
fi
echo -e '\e[38;5;198m'"++++ "
echo -e '\e[38;5;198m'"++++ CPU is $ARCH"
echo -e '\e[38;5;198m'"++++ "

echo -e '\e[38;5;198m'"++++ "
echo -e '\e[38;5;198m'"Installing Docker"
echo -e '\e[38;5;198m'"++++ "
sudo add-apt-repository -y "deb [arch=$ARCH] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update -qq < /dev/null > /dev/null
sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq --allow-downgrades --assume-yes docker-ce docker-ce-cli containerd.io docker-compose-plugin < /dev/null > /dev/null

echo -e '\e[38;5;198m'"++++ "
echo -e '\e[38;5;198m'"Set Docker Configs"
echo -e '\e[38;5;198m'"++++ "
sudo usermod -aG docker ubuntu
sudo mkdir -p /etc/docker
# https://docs.docker.com/config/daemon/prometheus/
cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "metrics-addr": "0.0.0.0:9323",
  "experimental": true,
  "storage-driver": "overlay2",
  "insecure-registries": ["10.9.99.10:5001", "10.9.99.10:5002", "localhost:5001", "localhost:5002"]
}
EOF

echo -e '\e[38;5;198m'"++++ "
echo -e '\e[38;5;198m'"Restart Docker Daemon"
echo -e '\e[38;5;198m'"++++ "
sudo service docker restart
sleep 5;
sudo chmod 777 /var/run/docker.sock

echo -e '\e[38;5;198m'"++++ "
echo -e '\e[38;5;198m'"Docker System prune"
echo -e '\e[38;5;198m'"++++ "
yes | sudo docker system prune -a
yes | sudo docker system prune --volumes

echo -e '\e[38;5;198m'"++++ "
echo -e '\e[38;5;198m'"++++ Docker info"
echo -e '\e[38;5;198m'"++++ "
docker info

echo -e '\e[38;5;198m'"++++ "
echo -e '\e[38;5;198m'"++++ Docker ps"
echo -e '\e[38;5;198m'"++++ "
docker ps

echo -e '\e[38;5;198m'"++++ "
echo -e '\e[38;5;198m'"++++ Docker stats"
echo -e '\e[38;5;198m'"++++ "
docker stats --no-stream -a

echo -e '\e[38;5;198m'"++++ "
echo -e '\e[38;5;198m'"++++ Docker Daemon installed"
echo -e '\e[38;5;198m'"++++ "
