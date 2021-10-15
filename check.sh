declare -A CHECK_FILES
CHECK_FILES=(
    ["yay"]="/usr/bin/yay"
    ["picom"]="/usr/bin/picom"
    ["picom-config"]="$HOME/.config/picom/picom.conf"
    ["ohmyzsh"]="$HOME/.oh-my-zsh/oh-my-zsh.sh"
    ["fcitx"]="/usr/bin/fcitx"
    ["fcitx-configtool"]="/usr/bin/fcitx-configtool"
    ["autojump"]="$HOME/.autojump/etc/profile.d/autojump.sh"
    ["nvim"]="/usr/bin/nvim"
    ["pulseaudio"]="/usr/bin/pulseaudio"
    ["wget"]="/usr/bin/wget"
    ["curl"]="/usr/bin/curl"
    ["firefox"]="/usr/bin/firefox"
    ["locale_conf"]="/etc/locale.conf"
    ["xinitrc"]="$HOME/.xinitrc"
    # ["fish"]="/usr/bin/fish"
    # ["fish-config"]="$HOME/.config/fish/config.fish"
    # ["starship"]="/usr/bin/starship"
    # ["starship-config"]="$HOME/.config/starship.toml"
    # ["dmenu"]="/usr/local/bin/dmenu"
    # ["dwm"]="/usr/local/bin/dwm"
    # ["dwmblocks"]="/usr/bin/dwmblocks"
    # ["st"]="/usr/bin/st"
)

declare -A CHECK_DIRS
CHECK_DIRS=(
    ["v2ray-core"]="$HOME/.config/qv2ray/vcore"
    ["wallpapers"]="$HOME/Pictures/wallpapers"
    ["zsh-autosuggestions"]="$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
    ["dmenu"]="/opt/dmenu-distrotube-git"
    ["dwm"]="/opt/dwm-distrotube-git"
    ["dwmblocks"]="/opt/dwmblocks-distrotube-git"
    ["st"]="/opt/st-distrotube-git"
    ["ranger"]="$HOME/.config/ranger"
)

function check_file_exist {
    for key in "${!CHECK_FILES[@]}"; do
	if [[ $key == $1 ]]; then
	    if [ -e ${CHECK_FILES[$key]} ]; then
                return 0
	    else
		return 1
	    fi
	fi
    done
    return 1
}

function check_dir_exist {
    for key in "${!CHECK_DIRS[@]}"; do
	if [[ $key == $1 ]]; then
	    if [ -d ${CHECK_DIRS[$key]} ]; then
                return 0
	    else
		return 1
	    fi
	fi
    done
    return 1
}

check_all () {
    for key in "${!CHECK_FILES[@]}"; do
	if !(check_file_exist $key); then
	    echo "${RED}check failed: $key${RESET}"
	fi
    done
    for key in "${!CHECK_DIRS[@]}"; do
	if !(check_dir_exist $key); then
	    echo "${RED}check failed: $key${RESET}"
	fi
    done
}
