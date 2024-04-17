variable "eks_settings" {
  default     = {}
  description = "Necessary settings for EKS provider"
}

module "eks" {
  source                                   = "terraform-aws-modules/eks/aws"
  cluster_name                             = var.eks_settings["cluster_name"]
  cluster_version                          = var.eks_settings["cluster_version"]
  subnet_ids                               = module.vpc.private_subnets
  vpc_id                                   = module.vpc.vpc_id
  enable_cluster_creator_admin_permissions = var.eks_settings["enable_cluster_creator_admin_permissions"]
  authentication_mode                      = var.eks_settings["authentication_mode"]
  cluster_security_group_id                = module.kubernetes_api_security_group.security_group_id
  cluster_endpoint_public_access           = var.eks_settings["cluster_endpoint_public_access"]

  cluster_addons = {
    coredns = {
      most_recent = true

    },
    kube-proxy = {
      most_recent = true
    },
    vpc-cni = {
      most_recent = true
    }
  }

  eks_managed_node_groups = {
    dev = {
      desired_capacity = 1
      max_capacity     = 1
      min_capacity     = 1

      instance_type = "t2.micro"
      key_name      = module.key_pair.key_pair_name

      k8s_labels = {
        Environment = "dev"
      }

    },

    prod = {
      desired_capacity = 1
      max_capacity     = 1
      min_capacity     = 1

      instance_type = "t3.medium"
      key_name      = module.key_pair.key_pair_name

      k8s_labels = {
        Environment = "prod"
      }

    }
  }
}
