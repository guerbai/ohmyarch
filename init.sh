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
. "$DIR/suckless-distrotube.sh"
. "$DIR/scripts/dispatch.sh"
. "$DIR/common/v2ray.sh"
. "$DIR/common/autojump.sh"
. "$DIR/common/ohmyzsh.sh"
. "$DIR/common/neovim.sh"
. "$DIR/config/config.sh"
. "$DIR/check.sh"

if [[ $1 == "check" ]]; then
    check_all
elif [[ $1 == "depencency" ]]; then
    install_dependency
elif [[ $1 == "wallpaper" ]]; then
    install_wallpaper
elif [[ $1 == "suckless" ]]; then
    install_suckless_distrotube
elif [[ $1 == "ohmyzsh" ]]; then
    install_ohmyzsh
elif [[ $1 == "autojump" ]]; then
    install_autojump
elif [[ $1 == "neovim" ]]; then
    init_neovim
else
    config_arch_cn
    install_dependency
    install_wallpaper
    install_suckless_distrotube
    install_v2ray
    install_ohmyzsh
    install_autojump
    dispatch_scripts
    init_config
    check_all
fi

echo "${GREEN}Arch Linux Init Success, Have Fun :P${RESET}"
