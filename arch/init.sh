GREEN=$(printf '\033[32m')
BLUE=$(printf '\033[34m')
YELLOW=$(printf '\033[33m')
RED=$(printf '\033[31m')
RESET=$(printf '\033[m')

# cn pacman arch version mirror
PACMAN_MIRROR=$(cat /etc/pacman.d/mirrorlist)
if [[ $PACMAN_MIRROR != *"tsinghua"* ]]; then
    sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
    sudo echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch' | cat - /etc/pacman.d/mirrorlist > temp && sudo mv temp /etc/pacman.d/mirrorlist
    echo "${BLUE}add tsinghua mirror success${RESET}"
fi

PACMAN_CONF=$(cat /etc/pacman.conf)
if [[ $PACMAN_CONF != *"archlinuxcn"* ]]; then
    echo "[archlinuxcn]
SigLevel = Never
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/\$arch" | sudo tee -a /etc/pacman.conf
    echo "${BLUE}add archlinuxcn success${RESET}"
fi
sudo pacman -Sy

DIR=$(pwd)
. "$DIR/dependency.sh"
. "$DIR/common/wallpaper.sh"
. "$DIR/common/picom.sh"
. "$DIR/suckless-distrotube.sh"
. "$DIR/common/v2ray.sh"
. "$DIR/common/autojump.sh"
. "$DIR/common/ohmyzsh.sh"
. "$DIR/check.sh"

if [[ $1 != "check" ]]; then
    install_dependency
    install_wallpaper
    config_picom
    install_suckless_distrotube
    install_v2ray
    install_ohmyzsh
    install_autojump
fi
check_all

echo "${GREEN}Arch Linux Init Success, Have Fun :P${RESET}"
