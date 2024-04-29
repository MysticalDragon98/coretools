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

    if ! $(is_node_installed) -eq "true"; then
        install_node
    fi

    if ! $(is_yarn_installed) -eq "true"; then
        install_yarn
    fi

    if ! $(is_tsnode_installed) -eq "true"; then
        install_tsnode
    fi

    if ! $(is_snap_installed) -eq "true"; then
        install_snap
    fi

    if ! $(is_certbot_installed) -eq "true"; then
        install_certbot
    fi

    if ! $(is_jq_installed) -eq "true"; then
        install_jq
    fi

    print "${SYMBOL_OK} All services has been installed."
}