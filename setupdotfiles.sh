echo "Setting up environment"

read -p "Is rust already installed? [y/N] " rust

echo "Installing packages"
sudo apt install -y git zsh vim neofetch

echo "Setting up shell"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Downloading dotfiles"
curl -o ~/.zshrc https://raw.githubusercontent.com/nathansmerrill/dotfiles/master/.zshrc.remote
curl -o ~/.p10k.zsh https://raw.githubusercontent.com/nathansmerrill/dotfiles/master/.p10k.zsh
curl -o ~/.vimrc https://raw.githubusercontent.com/nathansmerrill/dotfiles/master/.vimrc
sed -i "s/<USERNAME>/$USER/" ~/.zshrc

echo "Setting up vim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

echo "Installing rust packages"
case $rust in
    [Yy]* ) ;;
    [Nn]* | * ) curl https://sh.rustup.rs -sSf | sh -s -- -y ;;
esac
cargo install bat exa

echo "Adding motd"
sudo echo "neofetch" > /etc/profile.d/motd.sh

echo "Setup complete! Log in again to see changes..."
