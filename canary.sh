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
sudo sed -i -e 's/#Color/Color/' -i -e "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
sudo mv archpkgs/mirrorlist /etc/pacman.d/mirrorlist
sudo pacman -Sy --needed linux-lts wayland mesa pipewire{,-{jack,pulse,alsa}} wireplumber plasma-{wayland-session,nm,desktop,pa,firewall,disks,thunderbolt,vault,systemmonitor} kde{plasma-addons,-gtk-config} k{gamma5,infocenter,screen,screenlocker,menuedit,wayland-integration,eepassxc,pipewire} powerdevil gimp discover sddm{,-kcm} nemo{,-fileroller,-share} gparted qbittorrent rhythmbox lollypop x{ed,reader,fce4-{terminal,screenshooter}} libreoffice-still gnome-calculator mpv print-manager simple-scan vulkan-{radeon,icd-loader} wine gnutls lib{pulse,32-{gnutls,libpulse,pipewire{,-jack},mesa,vulkan-{radeon,icd-loader}}} steam flatpak xdg-desktop-portal-kde phonon-qt5-gstreamer gnu-free-fonts ttf-ubuntu-font-family rust aspell{,-en}yt-dlp atomicparsley virtualbox{,-host-modules-arch} firewalld neofetch
git clone --depth=1 https://aur.archlinux.org/grapejuice-git.git
cd grapejuice-git
makepkg -si --noconfirm
cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd
yay -S --noconfirm librewolf-bin popsicle-git xviewer timeshift plymouth-git downgrade

#Configure Plymouth
sudo sed -i -e 's/udev/udev plymouth/g' -i -e 's/encrypt/plymouth-encrypt/g' /etc/mkinitcpio.conf
sudo mkinitcpio -P linux
sudo sed -i 's/splash/splash vt.global_cursor_default=0/' /boot/loader/entries/arch.conf
sudo cp /usr/share/plymouth/arch-logo.png /usr/share/plymouth/themes/spinner/watermark.png
sudo sed -i 's/WatermarkVerticalAlignment=0.96/WatermarkVerticalAlignment=0.5/' /usr/share/plymouth/themes/spinner/spinner.plymouth

#Kernel fallbacks
sudo cp /boot/loader/entries/arch.conf /boot/loader/entries/arch-fallback.conf
sudo sed -i -e 's/Arch Linux/Arch Linux Fallback/' -i -e 's/initramfs-linux/initramfs-linux-fallback/' /boot/loader/entries/arch-fallback.conf
sudo cp /boot/loader/entries/arch.conf /boot/loader/entries/lts.conf
sudo sed -i -e 's/Arch Linux/Arch Linux-LTS/' -i -e 's/vmlinuz-linux/vmlinuz-linux-lts/' -i -e 's/initramfs-linux/initramfs-linux-lts/' /boot/loader/entries/lts.conf
sudo cp /boot/loader/entries/lts.conf /boot/loader/entries/lts-fallback.conf
sudo sed -i -e 's/Arch Linux/Arch Linux-LTS Fallback/' -i -e 's/initramfs-linux-lts/initramfs-linux-lts-fallback/' /boot/loader/entries/lts-fallback.conf

gsettings set org.cinnamon.desktop.privacy remember-recent-files false
gsettings set org.cinnamon.desktop.default-applications.terminal exec xfce4-terminal
sudo mv archpkgs/sha256sum.nemo_action /usr/share/nemo/actions
mv archpkgs/bashrc .bashrc
sudo mv archpkgs/yt-dlp.conf /etc/yt-dlp.conf
sudo timedatectl set-timezone Australia/Sydney
sudo systemctl enable systemd-timesyncd sddm-plymouth
systemctl --user --now enable wireplumber.service pipewire.service pipewire-pulse.service
reboot
