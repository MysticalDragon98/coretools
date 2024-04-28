is_node_installed () {
    if command -v node >/dev/null 2>&1; then
        echo "true"
    else
        echo "false"
    fi
}

install_node () {
    print "Installing node..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    apt_install nodejs
    print ${SYMBOL_OK} "NodeJS installed."
}