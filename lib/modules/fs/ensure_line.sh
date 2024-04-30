ensure_line () {
    local file=$1
    local line=$2
    local message=$3

    if ! grep -q "$line" "$file"; then
        if [ -n "$message" ]; then
            echo "$message"
        fi
        echo "$line" >> "$file"
        echo "true"
    else
        echo "false"
    fi
}