init_admin_bashrc () {
    local user=$1

    if [ -f "$user/.bashrc" ]; then
        print ${SYMBOL_OK} "Admin user .bashrc is setup"
    else
        print "Setting up admin user .bashrc..."
        
        sudo curl -s $FILE_BASHRC > /home/$ADMIN_USER/.bashrc

        print ${SYMBOL_OK} "Admin user .bashrc setup."
    fi
}