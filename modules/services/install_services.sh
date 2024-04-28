install_services () {
    print "Installing missing services..."
    
    if ! $(is_nginx_installed) -eq "true"; then
        install_nginx
    fi

    if ! $(is_supervisor_installed) -eq "true"; then
        install_supervisor
    fi

    if ! $(is_git_installed) -eq "true"; then
        install_git
    fi

    print "${SYMBOL_OK} All services has been installed."
}