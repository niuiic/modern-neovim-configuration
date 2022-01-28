if [[ $1 == "git" ]]; then
    git add -A
    git commit -m $2
    proxychains -q git pull origin $3
    proxychains -q git push -u origin $4
elif [[ $1 == "trans" ]]; then
    while true; do
        result=$(trans -brief -x 127.0.0.1:10025 zh:en $2)
        check=$(echo -e result | grep "[ERROR] Null response")
        if [[ $check == "" ]]; then
            echo -e $result
            break
        fi
    done
fi
