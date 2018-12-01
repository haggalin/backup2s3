#!/usr/bin/env bash
aws cloudformation create-stack --stack-name $1 --template-body file://template.yml --capabilities CAPABILITY_IAM
