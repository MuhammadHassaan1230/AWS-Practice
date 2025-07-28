#!/bin/bash
echo "choose the bucket to delete"
aws s3api list-buckets --query "Buckets[].Name" --output text

read -p "enter the name of the bucket to delete: " bucket_name

if [ -z "$bucket_name" ];then
  echo "Bucket name cannot be empty."
  exit 1
fi
echo "Deleting bucket: $bucket_name"
aws s3 rb s3://"$bucket_name" --force

if [ $? -eq 0 ]; then
  echo "✅ Bucket '$bucket_name' deleted successfully."
else
  echo "❌ Failed to delete the bucket. Please check your inputs and AWS configuration."
fi
echo "Done."

