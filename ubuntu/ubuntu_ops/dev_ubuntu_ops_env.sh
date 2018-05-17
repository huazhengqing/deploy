# ubuntu 换源 / 换国内的源
# 系统设置

# ubuntu 调整参数
ulimit -n 65536

# ubuntu mount / (vbox 访问 windows)
mkdir -p $HOME/my_sh
tee $HOME/my_sh/mount.sh <<-'EOF'
sudo mkdir -p /mnt/dev/
cd /mnt/
sudo mount -t vboxsf   dev  ./dev/
cd
EOF

chmod +x $HOME/*/*.sh
sudo $HOME/my_sh/mount.sh

ln -sf /mnt/dev/go    $HOME/go
ln -sf /mnt/dev    $HOME/dev


