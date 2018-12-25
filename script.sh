#!/bin/bash
START=$(date +%s)
user='ylony'
version='0.1 - 25-12-18'
gitName="Dimitri BERGER"
gitMail="hylow423@gmail.com"

echo "User selectionné : $user, la version du script est : $version"

# zsh git lib-hyper

echo "Installation de Git, Zsh et des libs pour le terminal Hyper"

sudo apt-get update > /dev/null
sudo apt-get install -y git zsh libdbusmenu-gtk4 libappindicator1 libindicator7 libgconf-2-4 libx11-xcb-dev > /dev/null
sudo apt-get install gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget
# Firefox

echo "Téléchargement de Firefox"

wget https://download-installer.cdn.mozilla.net/pub/devedition/releases/65.0b6/linux-x86_64/fr/firefox-65.0b6.tar.bz2 -q --show-progress

echo "Extraction ..."

sudo tar -xf firefox-65.0b6.tar.bz2 

sudo mkdir /opt

sudo mv ./firefox /opt/

sudo echo "alias firefox='/opt/firefox/firefox 2> /dev/null &'" >> /home/$user/.bashrc
sudo echo "alias firefox='/opt/firefox/firefox 2> /dev/null &'" >> /home/$user/.zshrc

# Oh my zsh
echo "Installation de Oh-my-zsh"

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Hyper Terminal

echo "Téléchargement du terminal Hyper"

sudo rm -rf ./deb
wget https://releases.hyper.is/download/deb -q --show-progress
sudo dpkg -i deb

echo "Installation du theme zsh Pure"
git clone https://github.com/sindresorhus/pure > /dev/null
sudo ln -s "$PWD/pure/pure.zsh" /usr/local/share/zsh/site-functions/prompt_pure_setup
sudo ln -s "$PWD/pure/async.zsh" /usr/local/share/zsh/site-functions/async

sudo echo 'autoload -U promptinit; promptinit' >> /home/$user/.zshrc
sudo echo 'prompt pure' >> /home/$user/.zshrc

echo "Installation de l'autocomplete pour zsh"

sudo mkdir /home/$user/.zsh/

sudo git clone https://github.com/zsh-users/zsh-autosuggestions /home/$user/.zsh/zsh-autosuggestions > /dev/null

sudo echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >> /home/$user/.zshrc

echo "Installation du theme hyper-snazzy pour hyper"

hyper install hyper-snazzy > /dev/null

echo "Installation du syntax highlighter pour zsh"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git > /dev/null

echo "source $(pwd)/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> /home/$user/.zshrc

echo "Configuration de git :"

git config --global user.email="$gitMail"
git config --global user.name \""$gitName"\"

echo "Installation de phpStorm"

sudo snap install phpstorm --classic
echo "alias pstorm='snap run phpstorm 2>/dev/null &'" >> /home/$user/.bashrc
echo "alias pstorm='snap run phpstorm 2>/dev/null &'" >> /home/$user/.zshrc

echo "Installation de SublimeText 3"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install -y apt-transport-https > /dev/null
echo "deb https://download.sublimetext.com/ apt/dev/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
echo "deb https://download.sublimetext.com/ apt/dev/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update > /dev/null
sudo apt-get install -y sublime-text > /dev/null

echo "Installation de VScode"
wget "https://az764295.vo.msecnd.net/stable/dea8705087adb1b5e5ae1d9123278e178656186a/code_1.30.1-1545156774_amd64.deb" -q --show-progress
sudo dpkg -i code_1.30.1-1545156774_amd64.deb > /dev/null

echo "Installation de Vim"
sudo apt-get install -y vim > /dev/null

echo "Installation de Docker & Docker-Compose"

sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic test"
sudo apt update
sudo apt install docker-ce

sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

END=$(date +%s)
DIFF=$(( $END - $START ))

echo "Fin après $DIFF secondes"

