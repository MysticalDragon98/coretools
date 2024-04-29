is_snap_installed () {
    if command -v snap >/dev/null 2>&1; then
        echo "true"
    else
        echo "false"
    fi
}

install_snap () {
    print "Installing snap..."
    apt_install snapd
    print ${SYMBOL_OK} "Snap installed."
}