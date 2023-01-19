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
sudo pacman -Syyu --needed wayland mesa pipewire-{media-session,jack,pulse,v4l2} plasma-{wayland-session,nm,desktop,pa,firewall,disks,thunderbolt,vault,systemmonitor} kde{plasma-addons,-gtk-config} xfce4-terminal k{gamma5,infocenter,screen,screenlocker,menuedit,wayland-integration,eepassxc,pipewire} powerdevil gimp discover sddm{,-kcm} nemo{,-fileroller} gparted spectacle qbittorrent rhythmbox lollypop x{ed,reader} libreoffice-still gnome-calculator mpv print-manager simple-scan oxygen vulkan-{radeon,icd-loader} wine gnutls lib{pulse,32-{gnutls,libpulse,pipewire{,-jack,-v4l2},mesa,vulkan-{radeon,icd-loader}}} steam flatpak xdg-desktop-portal-kde phonon-qt5-gstreamer gnu-free-fonts ttf-ubuntu-font-family virtualbox{,-host-modules-arch} firewalld neofetch
git clone --depth=1 https://aur.archlinux.org/grapejuice-git.git
cd grapejuice-git
makepkg -si --noconfirm
cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd
yay -S --noconfirm librewolf-bin mintstick sticky xviewer timeshift
gsettings set org.cinnamon.desktop.privacy remember-recent-files false
gsettings set org.cinnamon.desktop.defaults-applications.terminal exec xfce4-terminal
sudo mv archpkgs/sha256sum.nemo_action /usr/share/nemo/actions
sudo timedatectl set-timezone Australia/Sydney
sudo systemctl enable systemd-timesyncd sddm
sudo reboot
