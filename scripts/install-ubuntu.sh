# This file is used to install all the dependencies I use for my work.

# Updates
sudo apt update
sudo apt upgrade -y

sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

sudo apt install git -y

# Get the arch (eg x86_64, arm64, etc)
ARCH=$(dpkg --print-architecture)

# If arch is am64, change to x86_64
 if [ "$ARCH" = "amd64" ]; then
     ARCH="x86_64"
 fi

# Add repos for php, nginx
sudo add-apt-repository ppa:ondrej/php
sudo add-apt-repository ppa:nginx/stable

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

sudo apt install docker-ce
sudo usermod -aG docker ${USER}

# Get the latest version of docker-compose from github api using curl and save it to a variable
COMPOSE_LATEST=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')



mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/${COMPOSE_LATEST}/docker-compose-linux-${ARCH} -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose

docker compose version

# Install ZSH
sudo apt install zsh

# Oh My ZSH

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# add zsh to end of .bashrc
echo "zsh" >> ~/.bashrc

# install nginx, and the php extensions, and a few more things
sudo apt install php \
    php-bcmath \
    php-mysqlnd \
    php-pecl-zip \
    php-pgsql \
    php-posix \
    php-soap \
    nginx \
    python3

su - ${USER}


