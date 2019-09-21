set -e

. /etc/lsb-release

FOLDER=~/Downloads
PACKAGE_NAME=containerd.io_1.2.6-3_amd64.deb

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable"

sudo apt-get update

sudo apt-get install -y docker-ce

sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo usermod -aG docker $(whoami)

