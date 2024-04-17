eks_settings = {
  cluster_name                             = "boon-eks"
  cluster_version                          = "1.29"
  enable_cluster_creator_admin_permissions = "true"
  authentication_mode                      = "API_AND_CONFIG_MAP"
  cluster_endpoint_public_access           = "true"
}