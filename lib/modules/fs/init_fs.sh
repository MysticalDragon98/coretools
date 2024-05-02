init_fs () {
    folder=$1

    mkdir -p $folder/.bin
    mkdir -p $folder/services
    mkdir -p $folder/logs
    
    mkdir -p $folder/conf
    mkdir -p $folder/conf/nginx
    mkdir -p $folder/conf/supervisor

    print "${SYMBOL_OK} File system initialized at $folder..."
}