init_admin_bashrc () {
    local user=$1

    if [ -f "$BASE_PATH/.bashrc" ]; then
        print ${SYMBOL_OK} "Admin user .bashrc is setup"
    else
        print "Setting up admin user .bashrc..."
        
        sudo curl -s $FILE_BASHRC > $BASE_PATH/.bashrc

        print ${SYMBOL_OK} "Admin user .bashrc setup."
    fi

    if [ -f "$BASE_PATH/.profile" ]; then
        print ${SYMBOL_OK} "Admin user .profile is setup"
    else
        print "Setting up admin user .profile..."
        
        sudo curl -s $FILE_PROFILE > $BASE_PATH/.profile

        print ${SYMBOL_OK} "Admin user .profile setup."
    fi
}