is_scripts_installed () {
    if [ -d $SCRIPTS_PATH ]; then
        echo "true"
    else
        echo "false"
    fi
}

install_scripts () {
    sudo git clone $SCRIPTS_REPO $SCRIPTS_PATH
    chown -R $ADMIN_USER_VAR:$ADMIN_USER_VAR $SCRIPTS_PATH
    
    ensure_bash_after_login_script
}