install_autojump () {
    cd ~
    if check_file_exist "autojump"; then
	echo "${YELLOW}already has autojump installed, skip install_autojump${RESET}"
	return
    fi

    echo "${GREEN}manually install autojump start${RESET}"
    mkdir -p ~/Downloads
    cd ~/Downloads
    git clone git://github.com/wting/autojump.git
    cd autojump
    ./install.py
}
