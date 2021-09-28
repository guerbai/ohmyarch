install_qv2ray() {
    # cd ~/Downloads
    # if [ ! \( -e Qv2ray-v2.7.0-linux-x64.AppImage \) ]; then
    #     wget https://github.com/Qv2ray/Qv2ray/releases/download/v2.7.0/Qv2ray-v2.7.0-linux-x64.AppImage
    #     chmod a+x ./Qv2ray-v2.7.0-linux-x64.AppImage
    #     ./Qv2ray-v2.7.0-linux-x64.AppImage &
    # else
	# echo "Already has qv2ray, skip install_qv2ray"
    # fi

    cd ~/ohmyarch/static
    chmod a+x ./Qv2ray-v2.7.0-linux-x64.AppImage
    ./Qv2ray-v2.7.0-linux-x64.AppImage &
}

install_v2ray_core() {
    # cd ~/Downloads
    # wget https://github.com/v2fly/v2ray-core/releases/download/v4.42.2/v2ray-linux-64.zip 

    cd ~/ohmyarch/static
    mkdir -p ~/Downloads
    unzip v2ray-linux-64.zip -d ~/Downloads/vcore
    mkdir -p ~/.config/qv2ray/vcore
    cd ~/.config/qv2ray/vcore
    cp -r ~/Downloads/vcore/* .
}

align_time() {
    sudo ntpdate pool.ntp.org
}

install_v2ray () {
    install_qv2ray
    install_v2ray_core
    align_time
}

