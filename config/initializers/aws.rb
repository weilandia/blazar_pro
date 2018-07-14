require 'aws-sdk-s3'

aws_credentials = Rails.application.credentials.aws

Aws.config.update(
  access_key_id: aws_credentials[:access_key_id],
  secret_access_key: aws_credentials[:secret_access_key],
  region: aws_credentials[:region]
)

$s3_client = Aws::S3::Client.new
