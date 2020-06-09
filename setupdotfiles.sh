echo "Setting up environment"

echo "Setting up shell"
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Downloading dotfiles"
curl -o ~/.zshrc https://raw.githubusercontent.com/nathansmerrill/dotfiles/master/.zshrc.remote
curl -o ~/.p10k.zsh https://raw.githubusercontent.com/nathansmerrill/dotfiles/master/.p10k.zsh
curl -o ~/.vimrc https://raw.githubusercontent.com/nathansmerrill/dotfiles/master/.vimrc

echo "Setting up vim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install bat exa
