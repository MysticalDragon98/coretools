is_sysstat_installed () {
    if command -v mpstat >/dev/null 2>&1; then
        echo "true"
    else
        echo "false"
    fi
}

install_sysstat () {
    print "Installing sysstat..."
    apt_install sysstat
    print ${SYMBOL_OK} "Sysstat installed."
}