is_scripts_installed () {
    if [ -d $SCRIPTS_PATH ]; then
        echo "true"
    else
        echo "false"
    fi
}

install_scripts () {
    git clone $SCRIPTS_REPO $SCRIPTS_PATH
}