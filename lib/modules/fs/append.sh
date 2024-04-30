append () {
    local file=$1
    local msg=$2

    sudo echo "$msg" | sudo tee -a "$file" > /dev/null
}