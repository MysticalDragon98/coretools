verify_services () {
    print "Services:"

    verify_service "$(is_nginx_installed)" "Nginx"
    verify_service "$(is_supervisor_installed)" "Supervisor"
    verify_service "$(is_git_installed)" "Git"
}