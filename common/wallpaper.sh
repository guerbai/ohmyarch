install_wallpaper () {
    mkdir -p ~/Pictures
    cd ~/Pictures
    if check_dir_exist "wallpapers"; then
        echo "${YELLOW}already has wallpapers installed, skip it${RESET}"
        return
    fi

    echo "${GREEN}install distritube wallpapers start${RESET}"
    # git clone https://gitlab.com/dwt1/wallpapers
    git clone https://gitee.com/scriptgo/wallpapers
    xwallpaper --zoom ~/Pictures/wallpapers/0002.jpg
}
