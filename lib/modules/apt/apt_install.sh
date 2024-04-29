apt_install () {
    apt_update

    sudo apt-get install -y $1
}