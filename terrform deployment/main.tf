provider "aws" {
  region = "ap-south-1"
}

# S3 Bucket
resource "aws_s3_bucket" "bucket" {
  bucket = "my-flask-app-bucket-prj"
  force_destroy = true
}

# Launch EC2 Instance
resource "aws_instance" "flask_app" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  key_name      = "your-key-name"  # Replace with your key pair name

  vpc_security_group_ids = ["sg-<manually-created-id>"]  # Replace with your security group ID
  iam_instance_profile   = "arn:aws:iam::381492003657:role/<your-role-name>"

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install python3 -y
              pip3 install flask
              cat <<EOT > /home/ec2-user/app.py
              from flask import Flask, jsonify

              app = Flask(__name__)

              @app.route('/')
              def home():
                  return "Flask app is running on EC2!"

              @app.route('/list-bucket-content', methods=['GET'])
              def list_bucket_content():
                  return jsonify({"content": ["dir1/", "dir2/", "file1", "file2"]})

              if __name__ == '__main__':
                  app.run(host='0.0.0.0', port=5000)
              EOT
              python3 /home/ec2-user/app.py &
              EOF
}
