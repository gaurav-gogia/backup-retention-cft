provider "aws" {
  region = "us-east-1"
}

resource "aws_lb" "insecureLBTF" {
  name               = "insecure"
  load_balancer_type = "application"
}

resource "aws_lb_listener" "insecureListenerTF" {
  load_balancer_arn = aws_lb.insecureLBTF.arn
  port              = 80
  protocol          = "HTTP"
}

resource "aws_lb" "secureLBTF" {
  name               = "secure"
  load_balancer_type = "application"
}

resource "aws_lb_listener" "secureListenerTF" {
  load_balancer_arn = aws_lb.secureLBTF.arn
  port              = 443
  protocol          = "HTTPS"
}
