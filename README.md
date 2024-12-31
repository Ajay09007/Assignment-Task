# AWS Flask App Deployment Using Terraform
## Overview
This project demonstrates how to deploy a simple Flask HTTP service to AWS using Terraform. The service lists the contents of an S3 bucket and runs on an EC2 instance. Terraform is used to provision AWS infrastructure, including the S3 bucket, EC2 instance, and associated IAM roles and security groups.
## Features
- Flask HTTP Service:
  - `/`: Root endpoint that returns a welcome message.
  - `/list-bucket-content`: Lists the contents of the S3 bucket.
- AWS Infrastructure Provisioning using Terraform:
  - S3 bucket for content storage.
  - EC2 instance to host the Flask application.
  - Security group for HTTP (port 5000) and SSH (port 22) traffic.
  - IAM role for EC2 to access the S3 bucket.
## Prerequisites
- **AWS Account**: Ensure you have sufficient permissions to create resources like S3 buckets, EC2 instances, and IAM roles.
- **Terraform Installed**: Version `1.0` or higher.
- **Python 3 Installed**: For running the Flask app locally (optional).
## Deployment Instructions

### 1. Clone the Repository
```bash
git clone <repository-url>
cd aws-flask-app
