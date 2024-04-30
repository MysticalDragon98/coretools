ensure_supervisor_admin_permissions () {
    echo "Ensuring that $SUPERVISOR_SOCK_PATH belongs to the $ADMIN user"
    own $SUPERVISOR_SOCK_PATH
}