is_git_installed () {
    if command -v git >/dev/null 2>&1; then
        echo "true"
    else
        echo "false"
    fi
}

install_git () {
    print "Installing git..."
    apt_install git
}