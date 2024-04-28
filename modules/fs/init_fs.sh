init_fs () {
    folder=$1

    mkdir -p $folder/.bin
    mkdir -p $folder/services
    mkdir -p $folder/logs
    
    mkdir -p $folder/config
    mkdir -p $folder/config/nginx
    mkdir -p $folder/config/supervisor

    print "${SYMBOL_OK} File system initialized at $folder..."
}