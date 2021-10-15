install_dependency () {
    yes | sudo pacman -Syu
    tools=(
        "base-devel"
        "git"
        "curl"
        "pkg-config"
        "xorg"
        "xorg-xinit"
	"alsa-utils"
	"ntp"
	"fuse2"
        "unzip"
        "wget"
        "xwallpaper"
	"highlight"
	"ueberzug"
        "picom"
        "scrot"
	"zsh"
	# "fish"
	# "starship"
        "pulseaudio"
        "ranger"
	"yay"
	"neofetch"
	"sxiv"
	"clipmenu"
	"python-pip"
	"screenkey"
	"firefox"
	"wqy-zenhei"
	"fcitx-im"
	"fcitx-configtool"
    )
    for tool in ${tools[@]}; do
	sudo pacman -S --needed --noconfirm $tool
        echo "${GREEN}pacman install $tool success${RESET}"
    done
    xrandr -s 1920x1080

    cd ~/ohmyarch/static
    # wget --output-document ttf-joypixels.pkg.tar.zst https://archlinux.org/packages/community/any/ttf-joypixels/download
    sudo pacman -U --noconfirm ttf-joypixels-6.6.0-1-any.pkg.tar.zst
    echo "${GREEN}manually install ttf-joypixels success${RESET}"

    yes | yay -S nerd-fonts-hack
    echo "${GREEN}yay install nerd-fonts-hack success${RESET}"
    yes | yay -S ripgrep
    echo "${GREEN}yay install ripgrep success${RESET}"
    yes | yay -S neovim
    echo "${GREEN}yay install neovim success${RESET}"
    yes | yay -S --answerclean I --answerdiff N fcitx-sogoupinyin
    echo "${GREEN}yay install fcitx-sogoupinyin success${RESET}"
    yes | yay -S typora
    echo "${GREEN}yay install typora success${RESET}"

    pip install tldr
    pip install glances

    # mkdir -p ~/Downloads
    # cd ~/Downloads
    # wget --output-document ag.pkg.tar.zst https://archlinux.org/packages/community/x86_64/the_silver_searcher/download
    # sudo pacman -U --noconfirm ag.pkg.tar.zst
    # echo "${GREEN}manually install ag success${RESET}"

    # yes | yay -S alacritty-git
    # echo "${GREEN}yay install alacritty success${RESET}"
    # yes | yay -S brave
    # echo "${GREEN}yay install brave success${RESET}"
}
