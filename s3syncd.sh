#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

source ${DIR}/env.sh
FOLDER_LIST_FILE=${PRG_FOLDER_LIST_FILE}
BUCKET_NAME=${PRG_S3_BUCKET_NAME} # read from env variable

while read line; do
    echo $line
    if [[ $line == /* ]]; then
        aws s3 sync "${line}" "s3://${BUCKET_NAME}${line}" 
    else
        echo "Unable to parse line read from ${FOLDER_LIST_FILE}: '$line'" 
    fi 
done <${FOLDER_LIST_FILE}

