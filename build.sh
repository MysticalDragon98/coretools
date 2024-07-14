BUILD_FILE="build/index.sh"

write () {
    echo "$1" >> $BUILD_FILE
}

writeFile () {
    cat "$1" >> $BUILD_FILE
}

cat index.sh | grep ". ./" | while IFS= read -r line; do
    file=$(echo $line | sed 's/^. //')
    
    writeFile $file
    write "\n"
done

cat index.sh | grep "#? Main" -A 1000 | while IFS= read -r line; do
    write "$line"
done