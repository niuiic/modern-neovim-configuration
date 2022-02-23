showTodoList() {
    line_num=0
    if [[ -f ".todo" ]]; then
        bat .todo | while read line; do
            line_num=$(($line_num + 1))
            echo -e "[$line_num] $line"
        done
        echo -e "\n"
    fi
}

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
elif [[ $1 == "todo" ]]; then
    showTodoList
    echo "Do you want to add/update/delete tasks?"
    read operation
    time=$(date "+%Y-%m-%d %H:%M:%S")
    if [[ $operation == "add" ]]; then
        echo "Input your new task."
        read todo
        echo "($time) $todo" >>.todo
    elif [[ $operation == "update" ]]; then
        echo "Which task will be modified?"
        read num
        echo "Input your new task."
        read todo
        num=$num"s"
        sed -i "$num/.*/($time) $todo/" .todo
    elif [[ $operation == "delete" ]]; then
        echo "Which task will be deleted?"
        read num
        num=$num"d"
        sed -i "$num" .todo
    fi
elif [[ $1 == "sql" ]]; then
    if [[ -f "./tmp" ]]; then
        mysql -h localhost -u $2 -p$3 <./tmp
        rm ./tmp
    else
        echo "no input file."
    fi
fi
