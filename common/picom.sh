config_picom() {
    if check_file_exist "picom-config"; then
        echo "${YELLOW}already has picom configed, skip it${RESET}"
	return
    fi

    mkdir -p ~/.config/picom
    cd ~/.config/picom
    echo "opacity-rule = [
\"90:class_g = 'st-256color'\"
];

wintypes:
{
normal = { blur-background = true; };
splash = { blur-background = false; };
};

# Fading
fading = false;
fade-in-step = 0.07;
fade-out-step = 0.07;
fade-exclude = [ ];" > ~/.config/picom/picom.conf
    echo "${BLUE}config picom success${RESET}"
}
