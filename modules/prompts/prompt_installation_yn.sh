prompt_installation_yn () {
    local service=$1
    
    prompt_yn "$service is not installed. Would you like to install it? (y/n)"
}