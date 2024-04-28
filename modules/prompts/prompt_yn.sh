prompt_yn () {
    message=$1
    
    while true; do
        read -p "$message (y/n): " yn

        case $yn in
            [Yy]* ) echo "true"; exit;;
            [Nn]* ) echo "false"; exit;;
        esac
    done
}