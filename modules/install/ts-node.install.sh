is_tsnode_installed () {
    if command -v ts-node >/dev/null 2>&1; then
        echo "true"
    else
        echo "false"
    fi
}

install_tsnode () {
    print "Installing TS Node..."
    sudo npm i -g ts-node typescript @types/node
    print ${SYMBOL_OK} "TS Node installed."
}