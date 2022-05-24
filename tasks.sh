if [[ $1 == "trans" ]]; then
	while true; do
		result=$(trans -brief -x 127.0.0.1:10025 zh:en $2)
		check=$(echo -e result | grep "[ERROR] Null response")
		if [[ $check == "" ]]; then
			echo -e $result
			break
		fi
	done
fi
