provider "aws" {
  region = "us-east-1"
}

resource "aws_lb" "insecure" {
  name               = "insecure"
  load_balancer_type = "application"
}

resource "aws_lb_listener" "insecureListener" {
  load_balancer_arn = aws_lb.insecure.arn
  port              = 80
  protocol          = "HTTP"
}

resource "aws_lb" "secure" {
  name               = "secure"
  load_balancer_type = "application"
}

resource "aws_lb_listener" "secureListener" {
  load_balancer_arn = aws_lb.secure.arn
  port              = 443
  protocol          = "HTTPS"
}
