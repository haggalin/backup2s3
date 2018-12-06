# Introduction
This is a script to backup folders to AWS S3. It also includes a stack template for the AWS services needed. The script is developed for the purpose of being called by a  cron job.  

# Deploying
### Prerequisites
* Install and configure awscli to your AWS account.

### Launch stack
To create the stack for the first time:
```
./aws_stack create my-stack
```

### Configuring
Edit `env.sh` accordingly:
* `PRG_PYTHON_ENV_ACTIVATE` to your python environment activate script. (e.g. after using `virtualenv`). This environment needs to have awscli installed. (`pip install awscli`)
* `PRG_FOLDER_LIST_FILE`: Path to the file where each line contains the absolute folder path which should be backed up.
* `AWS_ACCESS_KEY_ID`: The aws access key from the stack created. 
* `AWS_SECRET_ACCESS_KEY`: The aws secret access key from the stack created.
* `PRG_S3_BUCKET_NAME`: The name of the bucket to sync to. Fetched from the stack created. 

Note you can use
```
aws cloudformation describe-stacks --stack-name=my-stack
```
to see the stack parameter outputs. 

### Customize
Customize the folder list file to your backup needs.

### Example
Watch `/root` folder:
```
root@hostname:~$ echo /root > folder_list.txt
```
Launch stack
```
root@hostname:~$ ./aws_stack.sh create my-example-stack
```
Create a python virtual environment with `awscli`
```
root@hostname:~$ virtualenv pyenv
root@hostname:~$ ./pyenv/bin/pip install awscli
```
Get stack parameters:
```
root@hostname:~$ aws cloudformation describe-stacks --stack-name=my-example-stack
{
    "Stacks": [
        {
            "StackId": ...,
            "StackName": "my-example-stack",
            ...
            "Outputs": [
                {
                    "OutputKey": "SecretAccessKey",
                    "OutputValue": "ABCDEFGHIJKLMNOPQRSTUVXYZ012345679!"#$%&",
                    "Description": "..."
                },
                {
                    "OutputKey": "S3BucketName",
                    "OutputValue": "my-example-stack-mys3bucket-abcdefghijklm",
                    "Description": "..."
                },
                {
                    "OutputKey": "AccessKey",
                    "OutputValue": "ABCDEFGHIJKLMNOPQRST",
                    "Description": "..."
                }
            ],
            ...
        }
    ]
}

```
Edit env.sh to use the following parameters:
```
PRG_PYTHON_ENV_ACTIVATE=/root/pyenv/bin/activate
PRG_FOLDER_LIST_FILE=/root/folder_list.txt
AWS_ACCESS_KEY_ID=ABCDEFGHIJKLMNOPQRST
AWS_SECRET_ACCESS_KEY=ABCDEFGHIJKLMNOPQRSTUVXYZ012345679!"#$%&
PRG_S3_BUCKET_NAME=my-example-stack-mys3bucket-abcdefghijklm
```

Change permissions
```
root@hostname:~$ chmod 600 env.sh
root@hostname:~$ chown root:root env.sh
root@hostname:~$ chmod +x s3sync.sh
root@hostname:~$ chown root:root s3sync.sh
```

Run sync
```
root@hostname:~$ ./s3sync.sh
```

# Development
Recommend ignoring further edits to the `env.sh` to prevent accidentaly AWS access key commits
```
git update-index --skip-worktree env.sh
```

Feel free to add suggestions or create pull requests.


