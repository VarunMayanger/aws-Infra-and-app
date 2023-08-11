resource "aws_s3_bucket" "my_s576573" {
  bucket = "mys3bucket8576484"

  tags = {
    Name        = "Mybucket"
    Environment = "Dev"
    purpose = "UI"
    Owner = " LL"
    Backup = "7"
    pacecode = "ABS1234"
  }
}