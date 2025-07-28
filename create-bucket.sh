#!/bin/bash
bucket_name="nfnskfs"
REGION="us-east-1"
read -p "enter the name of the bucket: " bucket_name
read -p "enter the region of the bucket: " REGION
if [ -z "$bucket_name" ]; then
  echo "Bucket name cannot be empty."
  exit 1
fi
echo "Creating bucket: $bucket_name in region: $REGION"

if [ "$REGION" == "us-east-1" ]; then
    aws s3api create-bucket --bucket "$bucket_name" --region "$REGION"
else
  aws s3api create-bucket \
    --bucket "$bucket_name" \
    --region "$REGION" \
    --create-bucket-configuration LocationConstraint="$REGION"
fi

if [ $? -eq 0 ]; then
  echo "✅ Bucket '$BUCKET_NAME' created successfully in region '$REGION'."
else
  echo "❌ Failed to create the bucket. Please check your inputs and AWS configuration."
fi
echo "Done."