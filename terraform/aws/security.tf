resource "aws_security_group" "website_mgmt" {
  name_prefix = local.sg_name_website_mgmt
  description = "Worker mgmt security group"
  tags = {
    Name = local.sg_name_website_mgmt
    Environment = local.environment
    GithubOrg   = "pyxintel"
    GithubRepo  = "pyxintel-website"
  }

  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/8",
    ]
  }
}

locals {
  sg_name_website_mgmt = "${local.business}-${local.environment}-${local.project}-mgmt"
}
