NGINX_FOLDER=/etc/nginx
NGINX_CONF_FILE=$NGINX_FOLDER/nginx.conf

is_nginx_installed () {
    if [ -f "$NGINX_CONF_FILE" ]; then
        echo true
    else
        echo false
    fi
}

install_nginx () {
    print "Installing Nginx..."
    apt_install nginx
    print "${SYMBOL_OK} Nginx installed."
}