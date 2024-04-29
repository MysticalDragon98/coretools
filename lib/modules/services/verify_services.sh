verify_services () {
    print "Services:"

    verify_service "$(is_nginx_installed)" "Nginx"
    verify_service "$(is_supervisor_installed)" "Supervisor"
    verify_service "$(is_git_installed)" "Git"
    verify_service "$(is_node_installed)" "NodeJS"
    verify_service "$(is_yarn_installed)" "Yarn"
    verify_service "$(is_tsnode_installed)" "TS Node"
    verify_service "$(is_snap_installed)" "Snap"
    verify_service "$(is_certbot_installed)" "Certbot"
    verify_service "$(is_jq_installed)" "JQ"
}