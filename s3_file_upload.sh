#!/bin/bash

bucket=$1
table=$2
srcFileName=$3
targetFileName=`basename $srcFileName`
echo $targetFileName
resource="/${bucket}/${table}/${targetFileName}"
#contentType="application/x-compressed-tar"
dateValue=`date -R`
stringToSign="PUT\n\n${contentType}\n${dateValue}\n${resource}"
s3Key=<<Access key ID >> 
s3Secret=<<Secret access key>>
echo "Before signature"
signature=`echo -en ${stringToSign} | openssl sha1 -hmac ${s3Secret} -binary | base64`
echo "SIG===$signature"
echo "Before Curl"
curl -L -X PUT -T "${srcFileName}" \
-H "Host: ${bucket}.s3.amazonaws.com" \
-H "Date: ${dateValue}" \
-H "Authorization: AWS ${s3Key}:${signature}" \
https://${bucket}.s3.amazonaws.com/${table}/${targetFileName}
echo "After Curl"
