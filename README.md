ping -c 3 archlinux.org  

efivar -l  
ls /sys/firmware/efi/efivar  

timedatectl set-ntp true  

lsblk  

gdisk /dev/sdX  

boot = ef00  
swap = 8200  
linuxfilesystem = 8300  

boot  
swap  
root  
home  

mkfs.fat -F32 /dev/sdXY(boot partition)  
mkfs.ext4 /dev/sdXY(root and home partition)  

mkswap /dev/sdXY  
swapon /dev/sdXY  

mount /dev/sdXY(root) /mnt  
mkdir /mnt/boot  
mkdir /mnt/home  
mount /dev/sdXY(boot) /mnt/boot  
mount /dev/sdXY(home) /mnt/home  

pacstrap /mnt base base-devel linux linux-firmware  

genfstab -U -p /mnt >> /mnt/etc/fstab  

arch-chroot /mnt  

pacman -Sy networkmanager neovim nano  

systemctl enable NetworkManager  

ln -sf /usr/share/zoneinfo/(REGION)/(CITY) /etc/localtime  

hwclock --systohc  

nvim /etc/locale.gen  

locale-gen  

echo LANG=en_US.UTF-8 > /etc/locale.conf  

nvim /etc/locale.conf  

LANG=en_US.UTF-8  
LC_ADDRESS=pt_BR.UTF-8  
LC_IDENTIFICATION=pt_BR.UTF-8  
LC_MEASUREMENT=pt_BR.UTF-8  
LC_MONETARY=pt_BR.UTF-8  
LC_NAME=pt_BR.UTF-8  
LC_NUMERIC=pt_BR.UTF-8  
LC_PAPER=pt_BR.UTF-8  
LC_TELEPHONE=pt_BR.UTF-8  
LC_TIME=pt_BR.UTF-8  

echo (computer-name) > /etc/hostname  

-FOR SSD  
-systemctl enable fstrim.timer  

nvim /etc/pacman.conf  

-Scroll down and un-comment the multilib repo:  

[multilib]  
Include=/etc/pacman.d/mirrorlist  

nvim /etc/hosts  

127.0.0.1	localhost  
::1		localhost  
127.0.1.1	(computer-name).localdomain	(computer-name)  

passwd  

useradd -m -G wheel -s /bin/bash (username)  

passwd (username)  

EDITOR=nvim visudo  

-Uncomment:  

%wheel ALL=(ALL) ALL  

or  

%wheel ALL=(ALL) NOPASSWD: ALL  

mount -t efivarfs efivarfs  
/sys/firmware/efi/efivars  

bootctl install  

nvim /boot/loader/entries/arch.conf  

-Type the following  

title Arch Linux  
linux /vmlinuz-linux  
initrd /intel-ucode.img  
initrd /initramfs-linux.img  

echo "options root=PARTUUID=$(blkid -s PARTUUID -o valeu /dev/sdXY<the /-root partition>) rw" >> /boot/loader/entries/arch.conf  

exit  
umount -R /mnt  

-touchpad support  

sudo pacman -S xf86-input-synaptics  

-video drivers  

sudo pacman -S mesa lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader ocl-icd lib32-ocl-icd intel-compute-runtime  

-Xorg  

sudo pacman -S xorg-server xorg-xinit  

or  

sudo pacman -S xorg-server xorg-apps xorg-xinit | xorg  

-installing dwm/st/dmenu and yay  

sudo pacman -S git  

cd ~  

git clone https://aur.archlinux.org/yay-git.git  

cd yay-git  

makepkg -si  

cd ~   

git clone https://git.suckless.org/dwm  
git clone https://git.suckless.org/st  
git clone https://git.suckless.org/dmenu  

cd dwm | st | dmenu  
sudo make clean install  

sudo pacman -S lightdm  

yay -S lightdm-webkit2-greeter lightdm-webkit-theme-aether  

or  

sudo pacman -S lightdm-gtk-greeter  

nvim /etc/lightdm/lightdm.conf  

greeter-session=lightdm-webkit2-greeter or lightdm-gtk-greeter  

nvim /etc/lightdm/lightdm-erbkit2-greeter.conf  

webkit_theme=lightdm-webkit-theme-aether  

sudo systemctl enable lightdm  

sudo pacman -S ccache  

sudo nvim /etc/makepkg.conf  

-find BUILDENV=  
-remove the ! in front of ccache  
-find MAKEFLAGS=  
-un-comment and change  

MAKEFLAGS="-j$(nproc)"  

nvim ~/.bashrc  

export PATH=$PATH:/usr/lib/ccache/bin  
export MAKEFLAGS="-j$(nproc)"  
export PATH=$PATH:$HOME/bin  
export PATH=$PATH:$HOME/.local/bin  



htop  
git  
nnn  
wget  
pulseaudio  
pulsemixer  
pulseaudio-alsa  
(suckless)sxiv  
(suckless)mpv  
(suckless)zathura  
ntfs-3g  
pacman-contrib  
ncdu  
libva-intel-driver  
lib32-libva-intel-driver  
shotgun  
-slock  
xsecurelock
redshift  
alsa-utils  
ttf-symbola  
ttf-joypixels  
ttf-inconsolata  
noto-fonts 
xorg-xev

-plasma  
kscreen 
kwalletmanager  
powerdevil  
plasma-pa 
plasma-nm



ls -l  
df -h  
tar -xvf  
git clone  
dmenu_path  
chown -R (username):(username)  
chmod +x  
Created ~/.gnupg/gpg.conf with "keyserver pgp.mit.edu" and it works  
patch -Np1 -i st-alpha-20180616-0.8.1.diff  
gcc -lm -o <output>  
pacman -Rns $(pacman -Qtdq)  
/opt/resolve/bin/resolve  
rm -rf  
cp  
mv  
du -hs  
source  
xinput  
xinput --list-props ID  
xinput set-prop ID PROPID VALUE  
ls -ltr  
sys/class/backlight/intel_backlight/brighness  

Note that many patches make changes config.def.h instead of config.h. Either move those changes also to config.h, or add rm config.h to the clean target in the Makefile.

/* commands */
static const char *cmdprintscreen[]  = { "shotprint.sh", NULL };


static Key keys[] = {
{ 0,    XK_Print,      spawn,          {.v = cmdprintscreen } },


Since version 2020.8, Reflector ships with an enableable reflector.service.

The service will run reflector with the parameters specified in /etc/xdg/reflector/reflector.conf

Enable reflector.service to run Reflector on boot. To run it immediately, start the service.

http://blog.evaldojunior.com.br/aulas/blog/shell%20script/2011/05/08/shell-script-parte-2-controle-de-fluxo.html

Adobe source code pro  
watch sensors  
terminus-font  

git clone https://git.suckless.org/dwm  
git clone https://git.suckless.org/st  
git clone https://git.suckless.org/dmenu  

First we check available modes.  
$ xrandr  
1440x900       59.9+*   75.0  
1280x1024      75.0     60.0  

Then we pick the mode, including resolution and refresh rate.  
$ xrandr -s 1440x900 -r 75  

Or just the refresh rate  
$ xrandr -r 75  

Let's see if it worked  
$ xrandr  
1440x900       59.9+    75.0*  
1280x1024      75.0     60.0  
