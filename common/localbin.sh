init_localbin() {
    mkdir -p $HOME/.local/bin
    cd ~/ohmyarch/localbin
    chmod +x *
    cp * $HOME/.local/bin/
    echo "${GREEN}init local bin success${RESET}"
}
