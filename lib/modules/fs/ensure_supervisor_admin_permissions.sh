ensure_supervisor_admin_permissions () {
    sudo chown -R $USER:$USER $SUPERVISOR_SOCKFILE
}