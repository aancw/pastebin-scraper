#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Not enough arguments";
  exit 0;
fi

if [[ $1 == '-g' ]] && [[ $2 != '' ]] ; then
        mkdir ./output/general/$2/
        echo "Searching pastebin..."
        curl -s -X GET "https://psbdmp.ws/api/search/$2" | python -m json.tool > ./output/general/$2/output.json
        cat ./output/general/$2/output.json | jq -r '.data[] | .id' | awk '{print "https://psbdmp.ws/" $1 }' > ./output/general/$2/urls.txt
        exit 0
        elif [[ $2 == '' ]]; then 
                echo "No input"
                exit 0
fi

if [[ $1 == '-e' ]] && [[ $2 != '' ]] ; then
        mkdir ./output/email/$2/
        echo "Searching pastebin..."
        curl -s -X GET "https://psbdmp.ws/api/search/email/$2" | python -m json.tool > ./output/email/$2/output.json
        cat ./output/email/$2/output.json | jq -r '.data[] | .id' | awk '{print "https://psbdmp.ws/" $1 }' > ./output/email/$2/urls.txt
        exit 0
        elif [[ $2 == '' ]]; then 
                echo "No input"
                exit 0
fi

if [[ $1 == '-d' ]] && [[ $2 != '' ]] ; then
        mkdir ./output/domain/$2/
        echo "Searching pastebin..."
        curl -s -X GET "https://psbdmp.ws/api/search/domain/$2" | python -m json.tool > ./output/domain/$2/output.json
        cat ./output/domain/$2/output.json | jq -r '.data[] | .id' | awk '{print "https://psbdmp.ws/" $1 }' > ./output/domain/$2/urls.txt
        exit 0
        elif [[ $2 == '' ]]; then
                echo "No input"
                exit 0
fi


