#!/bin/bash

# setup.sh
# https://github.com/ismayeel/setup.sh

# Author: Ismayeel
# Date: 2024-2-24

update() {
  echo "the script the setup for a new machine"
  sleep 1
}

function usage() {
  echo "Usage: you can only selecte Y,y or N,n"
  exit 1
}

update
clear
echo "terminal section"
# zsh
echo "Installing zsh "
read -p "Do you need it?: " need

if [[ $need == "Y" || $need == "y" ]]; then
  apt-get install -y zsh 2&> /dev/null
fi

if [[ $need == "N" || $need == "n" ]]; then
  echo "skipping zsh"
fi

if [[ $need != "Y" && $need != "y" && $need != "N" && $need != "n" ]]; then
  usage
fi

# oh-my-zsh
echo "Installing oh-my-zsh "
read -p "Do you need it?: " need

if [[ $need == "Y" || $need == "y" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended 2&> /dev/null
fi

if [[ $need == "N" || $need == "n" ]]; then
  echo "skipping oh-my-zsh"
fi

if [[ $need != "Y" && $need != "y" && $need != "N" && $need != "n" ]]; then
  usage
fi

# fzf
echo "Installing fzf" 
read -p "Do you need it?: " need

if [[ $need == "Y" || $need == "y" ]]; then
  apt-get install -y fzf 2&> /dev/null
fi

if [[ $need == "N" || $need == "n" ]]; then
  echo "skipping fzf"
fi

if [[ $need != "Y" && $need != "y" && $need != "N" && $need != "n" ]]; then
  usage
fi

# powerlevel10k
echo "Installing powerlevel10k"
read -p "Do you need it?: " need

if [[ $need == "Y" || $need == "y" ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k 2&> /dev/null
  sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
fi

if [[ $need == "N" || $need == "n" ]]; then
  echo "skipping powerlevel10k"
fi

if [[ $need != "Y" && $need != "y" && $need != "N" && $need != "n" ]]; then
  usage
fi

# catppuccin
https://raw.githubusercontent.com/catppuccin/gnome-terminal/main/install.py | python 2&> /dev/null

clear && echo "plugins section"; sleep 1
# all of my plugins
# zsh-autosuggestions
# zsh-syntax-highlighting
# zsh-z
# you should use . etc
# but one condition
# instead of plugins=(...)
# i need plugins=(
#  git
#  z
#  zsh-autosuggestions
#  zsh-syntax-highlighting
#  command-not-found
#  you-should-use
# )

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions > /dev/null

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting > /dev/null

# z is a plugin that is already installed

git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use > /dev/null

sed -i 's/plugins=(git)/plugins=(git z zsh-autosuggestions zsh-syntax-highlighting you-should-use)/g' ~/.zshrc
clear
echo "nvim section";sleep 1
apt-get install -y neovim 2&> /dev/null
#Nvchad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 2&> /dev/null

echo "making zsh the default shell"
# shellcheck disable=SC2046
chsh -s $(which zsh)

echo "already! blast off"

sleep 2

clear

echo "3"

sleep 3; clear

echo "2"

sleep 2; clear

echo "1"

sleep 1; clear

echo "
              ░░              
              ▓▓              
              ▓▓              
              ▓▓              
              ▓▓              
              ▓▓              
            ▓▓▓▓▓▓            
          ▓▓▓▓▓▓▓▓▓▓          
          ▓▓▓▓▓▓▓▓▓▓          
        ▓▓▓▓▓▓▓▓▓▓▓▓▓▓        
        ▓▓▓▓▓▓▓▓▓▓▓▓▓▓        
        ▓▓▓▓▓▓▓▓▓▓▓▓▓▓        
        ▓▓▓▓▓▓▓▓▓▓▓▓▓▓        
      ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓      
      ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓      
      ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓      
      ▓▓▓▓▓▓██████▓▓▓▓▓▓      
      ▓▓▓▓██████████▓▓▓▓      
      ▓▓▓▓██████████▓▓▓▓      
      ▓▓▓▓██████████▓▓▓▓      
      ▓▓▓▓▓▓██████▓▓▓▓▓▓      
      ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓      
      ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓      
      ▓▓▓▓▓▓██████▓▓▓▓▓▓      
      ▓▓▓▓██████████▓▓▓▓      
      ▓▓▓▓██████████▓▓▓▓      
      ▓▓▓▓██████████▓▓▓▓      
      ▓▓▓▓▓▓██████▓▓▓▓▓▓      
      ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓      
      ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓      
      ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓      
      ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓      
      ░░▓▓▓▓▓▓░░▓▓▓▓▓▓░░      
    ░░░░▓▓▓▓▓▓░░▓▓▓▓▓▓░░░░    
  ░░░░░░▓▓▓▓▓▓░░▓▓▓▓▓▓░░░░░░  
  ░░░░░░▓▓▓▓▓▓░░▓▓▓▓▓▓░░░░░░  
░░░░░░░░▓▓▓▓▓▓▒▒▓▓▓▓▓▓░░░░░░░░
░░░░░░░░▓▓▓▓▓▓▒▒▓▓▓▓▓▓░░░░░░░░
░░░░░░░░▓▓▓▓▓▓▒▒▓▓▓▓▓▓░░░░░░░░
░░░░░░  ▓▓▓▓▓▓▒▒▓▓▓▓▓▓  ░░░░░░
░░░░    ▓▓▓▓▓▓▒▒▓▓▓▓▓▓    ░░░░
░░    ▓▓▓▓  ▓▓▒▒▓▓  ▓▓▓▓    ░░
░░  ▓▓▓▓  ▓▓▒▒▒▒▓▓    ▓▓▓▓  ░░
      ▒▒  ▓▓▒▒  ▓▓    ▒▒      
      ▒▒  ▓▓▒▒  ▒▒▓▓  ▒▒      
    ▒▒  ▓▓  ▒▒  ▒▒▓▓    ▒▒    
    ▒▒  ▓▓  ▒▒  ▓▓▒▒▓▓  ▒▒    
    ▒▒  ▓▓▒▒  ▓▓▒▒  ▒▒▓▓▒▒    
    ▒▒▓▓▒▒    ▓▓▒▒    ▒▒      
      ▒▒  ▒▒  ▓▓▒▒            
          ▒▒  ▓▓▒▒            
            ▒▒▓▓▒▒            
              ▒▒              
              ▒▒              
"
echo "blast off successful!"
