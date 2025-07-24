#!/bin/bash
bucket_name="nfnskfs"
read -p "enter the name of the bucket: " bucket_name
REGION="us-east-1"
if [ -z "$bucket_name" ]; then
  echo "Bucket name cannot be empty."
  exit 1
fi
echo "Creating bucket: $bucket_name in region: $REGION"
aws s3api create-bucket --bucket "$bucket_name" --region "$REGION"

if [ $? -eq 0 ]; then
  echo "✅ Bucket '$BUCKET_NAME' created successfully in region '$REGION'."
else
  echo "❌ Failed to create the bucket. Please check your inputs and AWS configuration."
fi
echo "Done."