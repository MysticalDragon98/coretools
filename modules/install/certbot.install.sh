is_certbot_installed () {
    if command -v certbot >/dev/null 2>&1; then
        echo "true"
    else
        echo "false"
    fi
}

install_certbot () {
    print "Installing certbot..."
    sudo snap install --classic certbot
    sudo ln -s /snap/bin/certbot /usr/bin/certbot
    print ${SYMBOL_OK} "Certbot installed."
}