install_coretools () {
    if ! $(is_scripts_installed) -eq "true"; then
        install_scripts
    fi

    if ! $(is_bin_installed) -eq "true"; then
        install_bin
    fi
}