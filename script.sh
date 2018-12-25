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
sudo apt-get install -y git zsh libdbusmenu-gtk4 libappindicator1 libindicator7 > /dev/null

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

wget 'https://github-production-release-asset-2e65be.s3.amazonaws.com/62367558/8b05cf00-0078-11e9-8b9c-3b6266436298?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20181225%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20181225T105017Z&X-Amz-Expires=300&X-Amz-Signature=8853ee88046a749a793199d8e6686d8e3a536a650d9b87cf6ef81439834ffc6b&X-Amz-SignedHeaders=host&actor_id=0&response-content-disposition=attachment%3B%20filename%3Dhyper_2.1.0_amd64.deb&response-content-type=application%2Foctet-stream' -q --show-progress

sudo dpkg -i ./hyper_2.1.0_amd64.deb > /dev/null

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
git config --global user.name="$gitName"

echo "Installation de phpStorm"
sudo snap install phpstorm --classic

echo "Installation de SublimeText 3"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install -y apt-transport-https > /dev/null
echo "deb https://download.sublimetext.com/ apt/dev/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
echo "deb https://download.sublimetext.com/ apt/dev/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get install -y sublime-text > /dev/null

echo "Installation de VScode"
wget "https://az764295.vo.msecnd.net/stable/dea8705087adb1b5e5ae1d9123278e178656186a/code_1.30.1-1545156774_amd64.deb" -q --show-progress
sudo dpkg -i code_1.30.1-1545156774_amd64.deb > /dev/null

echo "Installation de Vim"
sudo apt-get install -y vim > /dev/null

END=$(date +%s)
DIFF=$(( $END - $START ))

echo "Fin après $DIFF secondes"

