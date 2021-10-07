dispatch_scripts () {
    mkdir -p $HOME/.local/bin
    cd ~/ohmyarch/scripts
    chmod +x *
    cp setbg $HOME/.local/bin/setbg
    cp set-volume $HOME/.local/bin/set-volume
    cp screenshot $HOME/.local/bin/screenshot

    # dwmblocks
    sudo rm /opt/dwmblocks-distrotube-git/scripts/volume
    sudo cp dwmblocks-volume /opt/dwmblocks-distrotube-git/scripts/volume
    echo "${GREEN}dispatch scripts success${RESET}"
}
