GREEN=$(printf '\033[32m')
BLUE=$(printf '\033[34m')
YELLOW=$(printf '\033[33m')
RED=$(printf '\033[31m')
RESET=$(printf '\033[m')

config_arch_cn () {
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
}

DIR=$(pwd)
. "$DIR/dependency.sh"
. "$DIR/common/wallpaper.sh"
. "$DIR/common/picom.sh"
. "$DIR/suckless-distrotube.sh"
. "$DIR/common/v2ray.sh"
. "$DIR/common/autojump.sh"
. "$DIR/common/ohmyzsh.sh"
. "$DIR/check.sh"

if [[ $1 == "check" ]]; then
    check_all
elif [[ $1 == "config_arch_cn" ]]; then
    config_arch_cn
elif [[ $1 == "depencency" ]]; then
    install_dependency
elif [[ $1 == "wallpaper" ]]; then
    install_wallpaper
elif [[ $1 == "config_picom" ]]; then
    config_picom
elif [[ $1 == "suckless" ]]; then
    install_suckless_distrotube
elif [[ $1 == "ohmyzsh" ]]; then
    install_ohmyzsh
elif [[ $1 == "autojump" ]]; then
    install_autojump
else
    config_arch_cn
    install_dependency
    install_wallpaper
    config_picom
    install_suckless_distrotube
    install_v2ray
    install_ohmyzsh
    install_autojump
    check_all
fi

echo "${GREEN}You can change your default shell to zsh with 'chsh -s \$(which zsh)'
Arch Linux Init Success, Have Fun :P${RESET}"
