ADMIN_USER=admin

init_admin_user () {
    if $(exists_user $ADMIN_USER) -eq "true"; then
        print ${SYMBOL_OK} "Admin user is setup"
    else
        print "Creating admin user..."
        create_user $ADMIN_USER
        print ${SYMBOL_OK} "Admin user created."
    fi
}