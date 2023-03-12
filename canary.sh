#Make Swapfile
sudo dd if=/dev/zero of=/swapfile bs=1M count=2048 status=progress
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo cp /etc/fstab /etc/fstab.bak
sudo echo '/swapfile none swap 0 0' | sudo tee -a /etc/fstab
sudo mount -a
sudo swapon -a
free -m
sudo sed -i 's/#resume=/resume=/' /boot/loader/entries/arch.conf

#Install Packages
sudo sed -i -e 's/#Color/Color/' -i -e "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
sudo mv archpkgs/mirrorlist /etc/pacman.d/mirrorlist
sudo pacman -Syu --needed linux-{headers,lts{,-headers}} wayland mesa pipewire{,-{jack,pulse,alsa}} wireplumber plasma-{wayland-session,nm,desktop,pa,firewall,disks,thunderbolt,vault,systemmonitor} k{gamma5,infocenter,screen{,locker},menuedit,wayland-integration,eepassxc,pipewire,de{plasma-addons,-gtk-config,nlive}} obs-studio powerdevil discover sddm{,-kcm} nemo{,-fileroller,-share} g{wenview,imp,parted,nome-calculator} qbittorrent rhythmbox lollypop x{reader,fce4-terminal,dg-desktop-portal-kde} spectacle libreoffice-still celluloid print-manager simple-scan vulkan-{radeon,icd-loader} wine{,-gecko,-mono} gnutls lutris vkd3d lib{pulse,mythes,va-mesa-driver,32-{gnutls,lib{pulse,va-mesa-driver},vkd3d,pipewire{,-jack},mesa,vulkan-{radeon,icd-loader}}} steam flatpak{,-kcm} phonon-qt5-gstreamer qt6-wayland gnu-free-fonts wl-clipboard vim-spell-en ttf-{hack-nerd,ubuntu-font-family} j{re{-openjdk,11-openjdk,8-openjdk},dk{-openjdk,11-openjdk,8-openjdk}} rustup hunspell{,-en_au} python-mutagen mythes-en yt-dlp cups{,-pdf} gutenprint foomatic-db-{engine,ppds,gutenprint-ppds} atomicparsley virtualbox{,-host-dkms} firewalld neofetch
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
rustup toolchain install stable
rustup default stable
mkdir rust
git clone --depth=1 https://aur.archlinux.org/grapejuice-git.git
cd grapejuice-git
makepkg -si --noconfirm
cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd
yay -S --noconfirm librewolf-bin plymouth timeshift downgrade prismlauncher

#Configure Plymouth
sudo sed -i -e 's/MODULES=()/MODULES=(amdgpu)/' -i -e 's/udev/udev plymouth/g' -i -e 's/encrypt/plymouth-encrypt/g' /etc/mkinitcpio.conf
sudo mkinitcpio -p linux linux-lts
sudo sed -i 's/splash/splash vt.global_cursor_default=0/' /boot/loader/entries/arch.conf
sudo cp /usr/share/plymouth/arch-logo.png /usr/share/plymouth/themes/spinner/watermark.png
sudo sed -i -e 's/DialogVerticalAlignment=.382/DialogVerticalAlignment=.75/' -i -e 's/WatermarkVerticalAlignment=.96/WatermarkVerticalAlignment=.5/' /usr/share/plymouth/themes/spinner/spinner.plymouth
sudo plymouth-set-default-theme -R spinner

#Kernel Fallbacks
sudo cp /boot/loader/entries/arch.conf /boot/loader/entries/arch-fallback.conf
sudo sed -i -e 's/Arch Linux/Arch Linux Fallback/' -i -e 's/initramfs-linux/initramfs-linux-fallback/' /boot/loader/entries/arch-fallback.conf
sudo cp /boot/loader/entries/arch.conf /boot/loader/entries/lts.conf
sudo sed -i -e 's/Arch Linux/Arch Linux-LTS/' -i -e 's/vmlinuz-linux/vmlinuz-linux-lts/' -i -e 's/initramfs-linux/initramfs-linux-lts/' /boot/loader/entries/lts.conf
sudo cp /boot/loader/entries/lts.conf /boot/loader/entries/lts-fallback.conf
sudo sed -i -e 's/Arch Linux/Arch Linux-LTS Fallback/' -i -e 's/initramfs-linux-lts/initramfs-linux-lts-fallback/' /boot/loader/entries/lts-fallback.conf

#Final Configuration
gsettings set org.cinnamon.desktop.privacy remember-recent-files false
gsettings set org.cinnamon.desktop.default-applications.terminal exec xfce4-terminal
sudo mv archpkgs/sddm.conf /etc/sddm.conf
mv archpkgs/bashrc .bashrc
# mv archpkgs/yt-dlp.conf .config/
sudo cp archpkgs/vimrc /etc/vim/vimrc
mv archpkgs/vimrc .vimrc
sudo timedatectl set-timezone Australia/Sydney
sudo systemctl enable systemd-timesyncd sddm-plymouth cups
systemctl --user --now enable wireplumber.service pipewire.service pipewire-pulse.service
rm -rf grapejuice-git/ archpkgs/ yay/
reboot
