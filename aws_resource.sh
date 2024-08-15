#!/bin/bash
###########################################
# Author: Mohammad Syed
# Version: V1
#
# Script to automate the process of listing the resources in AWS.

# Below are the services that are supported by this script:
# 1. EC2
# 2. RDS
# 3. S3
# 4. CloudFront
# 5. VPC
# 6. IAM
# 7. Route53
# 8. CloudWatch
# 9. CloudFormation
# 10. Lambda
# 11. SNS
# 12. SQS
# 13. DynamoDB
# 14. EBS

# The script will prompt the user to enter the AWS region and the service for which the resources need to be listed.
#
# Usage: ./aws_resource_list.sh <aws_region> <aws_service>
# Example: ./aws_resource_list.sh us-east-2 S3
#############################################################################

# Check whether the user entered the arguments correctly
if [ "$#" -ne 2 ]; then
    echo "Please enter the arguments required for the script to execute."
    echo "Usage: ./aws_resource_list.sh <aws_region> <aws_service>"
    echo "Example: ./aws_resource_list.sh us-east-2 S3"
    exit 1
fi

# Check whether the AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install AWS CLI and try again."
    exit 1
fi

# Check whether the AWS CLI is configured
if [ ! -d ~/.aws ]; then
    echo "AWS CLI is not configured. Please configure the AWS CLI and try again."
    exit 1
fi

# Assign arguments to variables and convert the service to lowercase
aws_region=$1
aws_service=$(echo "$2" | tr '[:upper:]' '[:lower:]')

# Use a case statement to list the resources in AWS
case $aws_service in
    ec2)
        echo "Listing EC2 Instances in $aws_region"
        aws ec2 describe-instances --region $aws_region
        ;;
    rds)
        echo "Listing RDS Instances in $aws_region"
        aws rds describe-db-instances --region $aws_region
        ;;
    s3)
        echo "Listing S3 Buckets"
        aws s3api list-buckets --region $aws_region
        ;;
    cloudfront)
        echo "Listing CloudFront Distributions"
        aws cloudfront list-distributions --region $aws_region
        ;;
    vpc)
        echo "Listing VPCs in $aws_region"
        aws ec2 describe-vpcs --region $aws_region
        ;;
    iam)
        echo "Listing IAM Users"
        aws iam list-users --region $aws_region
        ;;
    route53)
        echo "Listing Route53 Hosted Zones"
        aws route53 list-hosted-zones --region $aws_region
        ;;
    cloudwatch)
        echo "Listing CloudWatch Alarms"
        aws cloudwatch describe-alarms --region $aws_region
        ;;
    cloudformation)
        echo "Listing CloudFormation Stacks"
        aws cloudformation describe-stacks --region $aws_region
        ;;
    lambda)
        echo "Listing Lambda Functions"
        aws lambda list-functions --region $aws_region
        ;;
    sns)
        echo "Listing SNS Topics"
        aws sns list-topics --region $aws_region
        ;;
    sqs)
        echo "Listing SQS Queues"
        aws sqs list-queues --region $aws_region
        ;;
    dynamodb)
        echo "Listing DynamoDB Tables"
        aws dynamodb list-tables --region $aws_region
        ;;
    ebs)
        echo "Listing EBS Volumes in $aws_region"
        aws ec2 describe-volumes --region $aws_region
        ;;
    *)
        echo "Invalid service. Please enter a valid service."
        exit 1
        ;;
esac

