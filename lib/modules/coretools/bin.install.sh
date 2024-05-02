is_bin_installed () {
    if [ -d "$BIN_PATH/.git" ]; then
        echo "true"
    else
        echo "false"
    fi
}

install_bin () {
    sudo git clone $BIN_REPO $BIN_PATH
    chown -R $ADMIN_USER_VAR:$ADMIN_USER_VAR $BIN_PATH
    
    ensure_bash_after_login_script
}