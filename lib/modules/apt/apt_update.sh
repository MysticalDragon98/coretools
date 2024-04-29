APT_APT_UPDATE_IS_ALREADY_UPDATED=0

apt_update () {
    if [ $APT_APT_UPDATE_IS_ALREADY_UPDATED -eq 1 ]; then
        return 1
    fi
    
    sudo apt-get update
    APT_APT_UPDATE_IS_ALREADY_UPDATED=1
}