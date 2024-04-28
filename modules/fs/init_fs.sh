init_fs () {
    folder=$1

    print("Initializing file system at $folder...")

    mkdir -p $folder/services
    mkdir -p $folder/logs
    
    mkdir -p $folder/config
    mkdir -p $folder/config/nginx
    mkdir -p $folder/config/supervisor
}