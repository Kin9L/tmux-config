# Ubuntu environment setting

## apt related
```bash
sudo sed -i 's/[a-z.]*archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
sudo apt update
sudo apt install software-properties-common -y
```

## toolchain
```bash
# gcc
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo sed -i 's/http:\/\/ppa.launchpad.net/https:\/\/launchpad.proxy.ustclug.org/g' /etc/apt/sources.list.d/*.list
sudo apt update
sudo apt install gcc-11 -y
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 50

```

## pyenv
```bash
sudo apt install zlib1g-dev libssl-dev build-essential libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# set up pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc

source ~/.bashrc

# install pyenv-virtualenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

# set up pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

source ~/.bashrc

# install python
pyenv install 3.7.17
pyenv virtualenv 3.7.17 py3.7.17
pyenv activate py3.7.17

```

## docker
```bash
sudo apt install snap -y
sudo snap install docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo chown root:docker /var/run/docker.sock
```


## tmux-config
```bash
sudo apt install tmux -y
```

1. Install `TMP` tool
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
2. Install `xclip` to enable access to system's clipboard
```bash
sudo apt install xclip -y
```

3. Load configs to `tmux`
```bash
tmux source ~/.tmux.conf
```
