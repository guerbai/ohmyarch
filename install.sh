########## archiso
# check net
ping google.com
ping baidu.com
timedatectl set-ntp true
timedatectl status
fdisk /dev/sda
# 分区: efi(550M), swap, ext4(剩余)，先分再改类型
# g(一次)
# n(三次) +550M +2G remain
# t(change type二次，第三个不用变) 分区1->类型1 分区2->类型19
# w

mkfs.fat -F32 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2
mkfs.ext4 /dev/sda3

mount /dev/sda3 /mnt
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

########## chroot
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc

# locale
sudo sed 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen | sudo tee -a temp && sudo mv temp /etc/locale.gen
locale-gen
# host
echo "archlinux" > /etc/hostname
echo "127.0.0.1	localhost
::1		       localhost
127.0.1.1	archvbox.localdomain	archvbox" | tee -a /etc/hosts

# user
passwd
useradd -m guerbai
passwd guerbai
usermod -aG wheel,audio,video,optical,storage guerbai
pacman -S sudo vim
visudo
# 取消注释：%wheel ALL=(ALL) ALL

# boot
pacman -S grub efibootmgr dosfstools os-prober mtools
mkdir /boot/EFI
mount /dev/sda1 /boot/EFI
grub-install --target=x86_64-efi --bootloader-id=grub-uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S networkmanager git
systemctl enable NetworkManager
exit

########## archiso
umount -l /mnt
shutdown now
