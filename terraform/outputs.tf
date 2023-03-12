data "aws_eks_cluster" "example" {
  name = aws_eks_cluster.eks-cluster.name
}

output "cluster_oidc_issuer_url" {
  value = data.aws_eks_cluster.example.identity
}