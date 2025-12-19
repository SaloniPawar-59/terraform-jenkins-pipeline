resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  user_data              = var.user_data
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}
