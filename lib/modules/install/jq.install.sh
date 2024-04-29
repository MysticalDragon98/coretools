is_jq_installed () {
    if command -v git >/dev/null 2>&1; then
        echo "true"
    else
        echo "false"
    fi
}

install_jq () {
    print "Installing jq..."
    apt_install jq
    print ${SYMBOL_OK} "JQ installed."
}