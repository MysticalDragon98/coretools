is_make_installed () {
    if command -v make >/dev/null 2>&1; then
        echo "true"
    else
        echo "false"
    fi
}

install_make () {
    print "Installing make..."
    apt_install make
    print ${SYMBOL_OK} "Make installed."
}