resource "aws_eks_cluster" "eks-cluster" {
  name    = "eks_cluster"
  version = "1.23"

  role_arn = aws_iam_role.eks-role.arn

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = true

    subnet_ids = [
      aws_subnet.private_subnet_1.id,
      aws_subnet.private_subnet_2.id,
      aws_subnet.public_subnet_1.id,
      aws_subnet.public_subnet_2.id
    ]
  }

  depends_on = [
    aws_iam_role.eks-role,
    aws_iam_role_policy_attachment.eks_cluster_policy_to_role
  ]
}