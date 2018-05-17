# git
sudo apt-get install -y  git git-gui gitk

# chrome
sudo apt-get install -y   google-chrome-stable

# vscode
wget https://vscode.cdn.azure.cn/stable/79b44aa704ce542d8ca4a3cc44cfca566e7720f1/code_1.21.1-1521038896_amd64.deb
sudo dpkg -i code_1.21.1-1521038896_amd64.deb
sudo apt-get install -f  

sudo tee -a /etc/sysctl.conf <<-'EOF'
fs.inotify.max_user_watches=524288
EOF
sudo sysctl -p

# ubuntu nautilus
sudo add-apt-repository ppa:vascofalves/gnome-backports
sudo apt-get update
sudo apt-get install -y nautilus gksu nemo  

tee $HOME/my_sh/root_dir.sh <<-'EOF'
xhost +
sudo nemo
EOF
sudo chmod +x $HOME/*/*.sh

# 五笔
sudo apt-get install -y ibus ibus-table ibus-table-wubi

# team viewer
cd $HOME/dev/software/
sudo dpkg -i teamviewer_13.1.3026_amd64.deb
sudo apt-get install -f

# vlc
sudo apt-get install -y vlc browser-plugin-vlc






