#!/bin/sh

ZIP="simpleliveworkflow_resources.zip"
ZIP_FOLDER="/tmp"
BUCKET="rodeolabz"
REGIONS="us-east-1 us-west-2 eu-west-1"
PROFILE="techmarketing"

for REG in $REGIONS; do
    echo Uploading region $REG
    aws s3 cp $ZIP_FOLDER/$ZIP s3://$BUCKET-$REG/cloudformation/$ZIP --profile $PROFILE --region $REG
    for TEMPLATE in `ls -1 *.json`; do
        aws s3 cp $TEMPLATE s3://$BUCKET-$REG/cloudformation/$TEMPLATE --profile $PROFILE --region $REG
    done
done
