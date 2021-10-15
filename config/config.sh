init_config() {
    # xinitrc
    if check_file_exist "xinitrc"; then
        echo "${YELLOW}already has xinitrc configed, skip it${RESET}"
    else
        cp ~/ohmyarch/config/xinitrc ~/.xinitrc
    fi

    # locale
    sudo sed 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen | sudo tee -a temp && sudo mv temp /etc/locale.gen
    sudo sed 's/#zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/' /etc/locale.gen | sudo tee -a temp && sudo mv temp /etc/locale.gen
    sudo locale-gen
    if check_file_exist "locale_conf"; then
        echo "${YELLOW}already has locale.conf configed, skip it${RESET}"
    else
        sudo cp ~/ohmyarch/config/locale.conf /etc/locale.conf
    fi

    # picom
    if check_file_exist "picom-config"; then
        echo "${YELLOW}already has picom configed, skip it${RESET}"
    else
        mkdir -p ~/.config/picom
        cp ~/ohmyarch/config/picom.conf ~/.config/picom/picom.conf
    fi

    # dwm-autostart
    DWM_AUTOSTART=$(cat /opt/dwm-distrotube-git/autostart.sh)
    if [[ $DWM_AUTOSTART == *"Pictures"* ]]; then
        echo "${YELLOW}already has dwm-autostart configed, skip it${RESET}"
    else
        cat ~/ohmyarch/config/dwm-autostart | sudo tee -a /opt/dwm-distrotube-git/autostart.sh
    fi

    # zshrc
    ZSHRC_CONTENT=$(cat ~/.zshrc)
    if [[ $ZSHRC_CONTENT == *"neofetch"* ]]; then
        echo "${YELLOW}already has .zshrc configed, skip it${RESET}"
    else
        cat ~/ohmyarch/config/zshrc | tee -a ~/.zshrc
    fi

    # ranger
    if check_dir_exist "ranger"; then
        echo "${YELLOW}already has ranger configed, skip it${RESET}"
    else
	cp -r ~/ohmyarch/config/ranger ~/.config/ranger
    fi

}
