is_yarn_installed () {
    if command -v yarn >/dev/null 2>&1; then
        echo "true"
    else
        echo "false"
    fi
}

install_yarn () {
    print "Installing yarn..."
    sudo npm i -g yarn
    print ${SYMBOL_OK} "Yarn installed."
}