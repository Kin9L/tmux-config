# Ubuntu environment setting

## apt related
```bash
sudo sed -i 's/[a-z.]*archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
sudo apt update
sudo apt install software-properties-common -y
```

## input method
```bash
sudo apt update
sudo apt install fcitx -y
sudo cp /usr/share/applications/fcitx.desktop /etc/xdg/autostart/
sudo apt purge ibus -y
sudo dpkg -i ~/Downloads/sogoupinyin_4.2.1.145_amd64.deb
sudo apt install libqt5qml5 libqt5quick5 libqt5quickwidgets5 qml-module-qtquick2 -y
sudo apt install libgsettings-qt1 -y
```
Fix Chinese words display errors: https://www.cnblogs.com/CodeAndMoe/p/14279135.html
Add the following settings into `/etc/environment`
```bash
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx

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
### clang
```bash
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
```
Add the following contents into `/etc/apt/sources.list.d/llvm-apt.list`
```bash
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb [arch=amd64] https://mirrors.tuna.tsinghua.edu.cn/llvm-apt/jammy/ llvm-toolchain-jammy main
# deb-src https://mirrors4.tuna.tsinghua.edu.cn/llvm-apt/jammy/ llvm-toolchain-jammy main
```
### References
https://mirrors.tuna.tsinghua.edu.cn/help/llvm-apt/

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
# snap
sudo apt install snap -y
sudo snap install docker

# apt
curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo chown root:docker /var/run/docker.sock
```


## tmux-config
```bash
# ubuntu
sudo apt install tmux -y
sudo apt install xclip -y

# mac
brew install tmux
brew install xclip
```

1. Install `TMP` tool
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
2. Install `xclip` to enable access to system's clipboard
```bash
sudo apt install xclip -y
```

3. Install `network bandwidth` plugin
```bash
sudo apt-get install gawk net-tools coreutils -y
# add configs into .tmux.conf
```

4. Load configs to `tmux`
```bash
tmux source ~/.tmux.conf
```

### Reference
1. https://github.com/xamut/tmux-network-bandwidth

## VIM

```bash
imap jj <Esc>
```




## Vscode

### Python Formatter

1. Install 'Ruff' extension in *Vscode*.
2. Install 'Black' extension in *Vscode*.
3. Add the following configs into `setting.json`
```json
    "[python]": {
        "editor.defaultFormatter": "ms-python.black-formatter",
        "editor.formatOnSave": true,
        "editor.codeActionsOnSave": {
            "source.fixAll.ruff": true,
            "source.organizeImports.ruff": true
        },
        "editor.formatOnType": true
    },
    "black-formatter.args": [
        "--skip-string-normalization",
    ],
    "editor.rulers": [80]
```
4. A config file can be added in the root path of the project for `Black` and `Ruff`

```yaml
# https://black.readthedocs.io/en/stable/the_black_code_style/current_style.html
[tool.black]
line-length = 80

# https://beta.ruff.rs/docs/settings/
[tool.ruff]
line-length = 80
# https://beta.ruff.rs/docs/rules/
select = ["E", "W", "F"]
ignore = ["F401"]
# Exclude a variety of commonly ignored directories.
respect-gitignore = true
ignore-init-module-imports = true
```
#### VIM
Use `jj` rather than `Esc`
```json
{
    "vim.insertModeKeyBindings": [
        {
            "before": ["j", "j"],
            "after": ["<Esc>"]
        }
    ]
}
```

#### zsh
```bash

sudo apt install zsh git curl -y

# no sudo
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://install.ohmyz.sh/)"

# config theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
Modify `~/.zshrc`, applay this setting: `ZSH_THEME="powerlevel10k/powerlevel10k"`
```bash
sed -i 's|ZSH_THEME="robbyrussell"|ZSH_THEME="powerlevel10k/powerlevel10k"|g' ~/.zshrc
```

Install plugins.
```bash

# autosuggestions for commands
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 

```

Enable plugins.
Edit ~/.zshrc, changing the following contents.
```bash
sed -i "s|plugins=(git)|plugins=(git zsh-autosuggestions zsh-syntax-highlighting)|g" ~/.zshrc
```

Reconfig.
```bash
p10k configure
```

#### Reference
https://blog.davidz.cn/post/python-linter-ruff-formatter-black
<br>
https://www.haoyep.com/posts/zsh-config-oh-my-zsh/
