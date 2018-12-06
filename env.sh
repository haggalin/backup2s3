#!/usr/bin/env bash
export PRG_PYTHON_ENV_ACTIVATE=/opt/s3backup/pyenv/bin/activate
export PRG_FOLDER_LIST_FILE=/opt/s3backup/folder_list.txt

# Following parameters need to be fetched from your outputs of the created aws stack
export AWS_ACCESS_KEY_ID=<YOUR_AWS_ACCESS_KEY>
export AWS_SECRET_ACCESS_KEY=<YOUR_AWS_SECRET_ACCESS_KEY>
export PRG_S3_BUCKET_NAME=<YOUR_AWS_BUCKET_NAME>

source $PRG_PYTHON_ENV_ACTIVATE