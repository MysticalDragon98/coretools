install_services () {
    print "Installing missing services..."
    
    if ! $(is_nginx_installed) -eq "true"; then
        if $(prompt_installation_yn "Nginx") -eq "true"; then
            install_nginx
        fi
    fi

    if ! $(is_supervisor_installed) -eq "true"; then
        if $(prompt_installation_yn "Supervisor") -eq "true"; then
            install_supervisor
        fi
    fi

    if ! $(is_git_installed) -eq "true"; then
        if $(prompt_installation_yn "Git") -eq "true"; then
            install_git
        fi
    fi

    print "Services installed."
}