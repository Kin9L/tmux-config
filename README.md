# Ubuntu environment setting

## apt sources
```bash
sudo sed -i 's/[a-z.]*archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
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
