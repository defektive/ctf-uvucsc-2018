#! /bin/bash

# curl -i https://ctf.uvucsc.com/chals

for cat in `cat challenges.json | jq -r '.game[].category' | sort -u`; do
  mkdir -p "$cat";
  while read chal; do
    id=`echo "$chal" | cut -d - -f 1`
    sort_id=$(( $id + 10000 ))
    name=`echo "$chal" | cut -d - -f 2`
    folder="$cat/$sort_id-$name"
    mkdir -p "$folder";
    echo "### $name" > "$folder"/README.md
    cat challenges.json | jq -r '.game[] | select(.id == '$id') | "*" + (.value|tostring) + " points*\n",.description ' >> "$folder"/README.md
    echo >> "$folder"/README.md
  done <<< $( cat challenges.json | jq -r '.game[] | select(.category == "'$cat'") | [(.id|tostring),.name]|join("-") ' )
done
