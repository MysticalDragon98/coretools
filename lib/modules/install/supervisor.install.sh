SUPERVISOR_FOLDER=/etc/supervisor
SUPERVISOR_CONF_FILE=$SUPERVISOR_FOLDER/supervisord.conf

is_supervisor_installed () {
    if [ -f "$SUPERVISOR_CONF_FILE" ]; then
        echo true
    else
        echo false
    fi
}

install_supervisor () {
    print "Installing Supervisor..."
    apt_install supervisor
    print "${SYMBOL_OK} Supervisor installed."
}