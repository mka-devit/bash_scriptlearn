#!/bin/bash

if ! command -v jq &> /dev/null
then
    echo "jq не установлен. Установите его, чтобы продолжить."
    exit
fi


input_file="ip-ranges.json"

output_file="filtered-ip-ranges.json"

ip_list_file="filtered-ip-list.txt"

if [[ ! -f "$input_file" ]]; then
    echo "Файл $input_file не найден."
    exit 1
fi

jq '.prefixes | map(select((.service == "EC2" or .service == "S3") and (.region == "us-east-1" or .region == "us-west-2"))) | {prefixes: .}' "$input_file" > "$output_file"

jq -r '.prefixes[] | .ip_prefix' "$output_file" > "$ip_list_file"

echo "Отфильтрованный JSON файл сохранен в $output_file"
echo "Список IP с маской сохранен в $ip_list_file"
