#!/bin/bash

echo "Setting up environment"

echo "Installing packages"
sudo apt install -y git zsh vim neofetch

echo "Setting up shell"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

mkdir ~/bin
curl -o ~/bin/dotfileupdate https://raw.githubusercontent.com/nathansmerrill/dotfiles/master/dotfileupdate
chmod +x ~/bin/dotfileupdate
~/bin/dotfileupdate

echo "Setting up vim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

echo "Installing rust packages"
curl https://sh.rustup.rs -sSf | sh -s -- -y
cargo install bat exa

echo "Setup complete! Log in again to see changes..."
