init_admin_user () {
    user=$1

    if $(exists_user $user) -eq "true"; then
        print ${SYMBOL_OK} "Admin user `$user` is setup"
    else
        print "Creating admin user..."
        create_user $user
        print ${SYMBOL_OK} "Admin user  `$user` created."
    fi

    init_admin_bashrc $user
}