# # replace sources
# echo -e "\033[32m========= Replace source list =========\033[0m"
# sudo sed -i 's/[a-z.]*archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
# sudo apt update
# sudo apt install software-properties-common openssh-server htop -y
# 
# # gcc
# echo -e "\033[32m========= Toolchain set up =========\033[0m"
# sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
# sudo sed -i 's/http:\/\/ppa.launchpad.net/https:\/\/launchpad.proxy.ustclug.org/g' /etc/apt/sources.list.d/*.list
# sudo apt update
# sudo apt install gcc-11 cmake make -y
# sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 11
 

# # tmux
# echo -e "\033[32m========= tmux ========\033[0m"
# sudo apt install tmux -y
# sudo apt install xclip gawk net-tools coreutils -y
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# 
# 
# # vim
# echo -e "\033[32m========= vim ========\033[0m"
# sudo  apt install vim -y
# echo "imap jj <Esc>" >> $HOME/.vimrc
# echo "set number" >> $HOME/.vimrc
# echo "set tabstop=4" >> $HOME/.vimrc
# echo "set expandtab" >> $HOME/.vimrc
# 
# 
# # zsh
# echo -e "\033[32m========= zsh ========\033[0m"
# sudo apt install zsh git curl -y
# sh -c "$(curl -fsSL https://install.ohmyz.sh/)"
# 
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# sed -i 's|ZSH_THEME="robbyrussell"|ZSH_THEME="powerlevel10k/powerlevel10k"|g' ~/.zshrc
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 
# sed -i "s|plugins=(git)|plugins=(git zsh-autosuggestions zsh-syntax-highlighting)|g" ~/.zshrc
# 
# 
# # pyenv
# echo -e "\033[32m========= pyenv ========\033[0m"
# sudo apt install -y zlib1g-dev libssl-dev build-essential libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev 
# # install pyenv
# git clone https://github.com/pyenv/pyenv.git ~/.pyenv
# # set up pyenv
# echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
# echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
# echo 'eval "$(pyenv init -)"' >> ~/.zshrc
# 
# # install pyenv-virtualenv
# git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
# 
# # set up pyenv-virtualenv
# echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
# 
# 
# # install python
# # pyenv install 3.7.17
# # pyenv virtualenv 3.7.17 py3.7.17
# # pyenv activate py3.7.17
# 
# 
# # nerd font
# echo -e "\033[32m========= nerd font ========\033[0m"
# git clone --depth=1 --recursive https://github.com/ryanoasis/nerd-fonts.git
# 
# cd nerd-fonts
# bash install.sh


# # wezterm
# echo -e "\033[32m========= wezterm ========\033[0m"
# echo
# curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
# echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
# sudo apt update
# sudo apt install wezterm -y
# git clone https://github.com/Kin9L/wezterm-config.git ~/.config/wezterm
# 
# 
# # Alias
# echo -e "\033[32m========= set up alias ========\033[0m" 
# echo "alias gco='git checkout'" >> ~/.zshrc
# echo "alias gb='git branch'" >> ~/.zshrc
# echo "alias gp='git pull -r'" >> ~/.zshrc
# echo "alias gs='git status'" >> ~/.zshrc
# echo "alias gr='git rebase'" >> ~/.zshrc
# echo "alias gitBranchSort='git for-each-ref --sort=committerdate --format=\"%(committerdate:iso8601) %(refname:short)\" refs/heads/ | less'" >> ~/.zshrc


# # Sougou input
# echo -e "\033[32m========= sougou input ========\033[0m" 
# sudo apt update
# sudo apt purge ibus -y
# sudo apt install fcitx -y
# sudo cp /usr/share/applications/fcitx.desktop /etc/xdg/autostart/
# sudo dpkg -i ~/Downloads/sogoupinyin_4.2.1.145_amd64.deb
# sudo apt install libqt5qml5 libqt5quick5 libqt5quickwidgets5 qml-module-qtquick2 -y
# sudo apt install libgsettings-qt1 -y


# # docker
# echo -e "\033[32m========= docker =========\033[0m"
# # Add Docker's official GPG key:
# sudo apt-get install ca-certificates curl -y
# sudo install -m 0755 -d /etc/apt/keyrings
# sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
# sudo chmod a+r /etc/apt/keyrings/docker.asc
# 
# # Add the repository to Apt sources:
# echo \
#   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
#   $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
#   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo apt-get update
# 
# sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
# 
# sudo groupadd docker
# sudo usermod -aG docker $USER
# newgrp docker
# sudo chown root:docker /var/run/docker.sock
