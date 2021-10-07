install_suckless_distrotube () {
    PACMAN_CONF=$(cat /etc/pacman.conf)
    if [[ $PACMAN_CONF != *"dt-arch-repo"* ]]; then
        echo "[dt-arch-repo]
SigLevel = Optional DatabaseOptional
Server = https://gitlab.com/dwt1/\$repo/-/raw/master/\$arch" | sudo tee -a /etc/pacman.conf
        echo "${BLUE}add dt-arch-repo success${RESET}"
    fi
    yes | sudo pacman -Syyu

    if !(check_dir_exist "dmenu"); then
        yes | sudo pacman -S dmenu-distrotube-git 
        cd /opt/dmenu-distrotube-git 
	sudo sed 's/pixelsize\=11/pixelsize\=24/' config.def.h | sudo tee -a temp && sudo mv temp config.def.h
	sudo sed 's/pixelsize\=8/pixelsize\=24/' config.def.h | sudo tee -a temp && sudo mv temp config.def.h
	sudo cp config.def.h config.h
        sudo make clean install
        echo "${GREEN}pacman install dmenu-distrotube${RESET}"
    fi
    if !(check_dir_exist "dwm"); then
        yes | sudo pacman -S dwm-distrotube-git 
        cd /opt/dwm-distrotube-git 
	# sudo mv config.def.h config.def.h.backup
	sudo sed 's/#define MODKEY Mod4Mask/#define MODKEY Mod1Mask/' config.def.h | sudo tee -a temp && sudo mv temp config.def.h
	sudo sed 's/size\=9/size\=14/' config.def.h | sudo tee -a temp && sudo mv temp config.def.h
	sudo sed 's/size\=8/size\=14/' config.def.h | sudo tee -a temp && sudo mv temp config.def.h
	sudo sed 's/size\=10/size\=14/' config.def.h | sudo tee -a temp && sudo mv temp config.def.h
	sudo cp config.def.h config.h
        sudo make clean install
        echo "${GREEN}pacman install dwm-distrotube${RESET}"
    fi
    if !(check_dir_exist "dwmblocks"); then
        yes | sudo pacman -S dwmblocks-distrotube-git 
        cd /opt/dwmblocks-distrotube-git 
        sudo make clean install
        echo "${GREEN}pacman install dwmblocks-distrotube${RESET}"
    fi
    if !(check_dir_exist "st"); then
        yes | sudo pacman -S st-distrotube-git 
        cd /opt/st-distrotube-git 
	sudo sed 's/pixelsize\=14/pixelsize\=16/' config.def.h | sudo tee -a temp && sudo mv temp config.def.h
	sudo cp config.def.h config.h
        sudo make clean install
        echo "${GREEN}pacman install st-distrotube${RESET}"
    fi
}
