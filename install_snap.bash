function install_snap {

    echo -e " ${BLUE} Installing Ruby"
    sleep 2 
    sudo apt-get update && \
    sudo apt-get install snapd snap
    sleep 2
    echo -e " ${BLUE} Snap has been installed! \033[0m"
    sleep 2


}