install_ohmyzsh () {
    cd ~
    if check_file_exist "ohmyzsh"; then
        echo "${YELLOW}already has ohmyzsh installed, skip it${RESET}"
    else
	rm -rf ~/.oh-my-zsh
        # sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        # sh -c "$(wget -O- https://gitee.com/jklash1996/ohmyzsh/raw/master/tools/install.sh)"
	cd ~/ohmyarch/static
	chmod a+x ohmyzsh-install.sh
	exit | ./ohmyzsh-install.sh
    fi

    if check_dir_exist "zsh-autosuggestions"; then
        echo "${YELLOW}already has ohmyzsh installed, skip it${RESET}"
	return
    fi

    echo "${GREEN}manually install zsh-autosuggestions start${RESET}"
    if [ -d "$HOME/.oh-my-zsh/custom/plugins"  ]; then
        cd ~/.oh-my-zsh/custom/plugins
        git clone https://github.com/zsh-users/zsh-autosuggestions
        cd ~
        sed 's/plugins\=(git)/plugins\=(git zsh-autosuggestions vi-mode)/' .zshrc > temp && mv temp .zshrc
    else
        echo "${YELLOW}install ohmyzsh failed, skip zsh-autosuggestions${RESET}"
    fi
}
