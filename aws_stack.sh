#!/usr/bin/env bash
programname=$0

function usage {
    echo "usage: $programname [OPTIONS] [create|update] <STACK_NAME>"
    echo "  create  creates the stack for the first time on aws"
    echo "  update  updates an existing stack on aws"
    echo "  -h      displays this message"
    exit 1
}

if [ "$#" -ne 2 ]; then
    usage
fi
aws cloudformation ${1}-stack --stack-name ${2} --template-body file://template.yml --capabilities CAPABILITY_IAM
