provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAWMVA3PZTPSCBYPWF"
  secret_key = "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"
}


variable "flag" {
    description = "flag:true or false"
    
}

resource "aws_s3_bucket" "mys3"{
 count = "${var.flag == "true" ? 1:0}"
 bucket = "sujith-2"
 acl    = "private"
 
 tags = {
  name = "sujith-2"
  Environment = "Dev"
 }
}

resource "aws_instance" "instance2" {
  count = "${var.flag == "false" ? 1:0}"
  ami           = "ami-0ed9277fb7eb570c9" 
  instance_type = "t2.micro"
  tags = {
     Name = "Ec2-conditional-poc"
  }
}