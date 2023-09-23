resource "aws_instance" "web" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld"
  }
  depends_on = [aws_s3_bucket.example]
}

resource "aws_s3_bucket" "example" {
  bucket = "tf7836783-test-bucket"
  tags = {
    Name = "My bucket"

  }
}