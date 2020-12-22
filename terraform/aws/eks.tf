module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  
  cluster_name    = local.cluster_name
  cluster_version = "1.18"
  subnets         = module.vpc.private_subnets

  tags = {
    Environment = local.environment
    GithubOrg   = "pyxintel"
    GithubRepo  = "pyxintel-website"
  }

  vpc_id = module.vpc.vpc_id

  worker_groups = [
    {
      name                          = local.project
      instance_type                 = "t2.small"
      additional_userdata           = "echo ${local.project}"
      asg_desired_capacity          = 2
      additional_security_group_ids = [aws_security_group.website_mgmt.id]
    }
  ]
}

locals {
  cluster_name = "${local.business}-${local.environment}"
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
