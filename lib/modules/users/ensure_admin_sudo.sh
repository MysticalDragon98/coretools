ensure_admin_sudo () {
    local user=$1
    local sudoers_file="/etc/sudoers.d/admin"

    if $(is_user_sudoer $user) == "true"; then
        print ${SYMBOL_OK} "Admin user $user is a sudoer"
    else
        print "Setting $user as a sudoer..."
        set_user_as_sudoer $user
        print ${SYMBOL_OK} "Admin user $user is now a sudoer."
    fi
}