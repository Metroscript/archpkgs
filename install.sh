bootctl install
sed -i 's/filesystems/encrypt filesystems/g' /etc/mkinitcpio.conf
mkinitcpio -p linux
sed -i 's/#timeout 3/timeout 3/' /boot/loader/loader.conf
mv /Archinstall/arch.conf /boot/loader/entries/
nano /boot/loader/entries/arch.conf
systemctl enable --now NetworkManager
sed -i 's/#en_AU.UTF-8 UTF-8/en_AU.UTF-8 UTF-8/' /etc/locale.gen
sed -i 's/#en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
mv /Archinstall/locale.conf /etc/
timedatectl set-timezone Australia/Sydney
nano /etc/hostname
passwd
useradd -m -g users -G wheel arch
passwd arch
sed -i 's/#%wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL' /etc/sudoers
reboot
