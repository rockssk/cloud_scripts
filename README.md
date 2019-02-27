# Cloud Scripts
Automation is needed , no matter wherever you are. One can find cloud specific automation scripts

Though uploading files to S3 is straight forward using AWS CLI commands, at some cases not all users are given that privilege to have CLI access. Here is a simple shell script that lets anyone upload a file to S3 from Linux serer

Usage

```bash
sh  s3_upload.sh <Bucket-name> <hive-table-name>/<partition> <local_file_location> ```
