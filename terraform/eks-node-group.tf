resource "aws_eks_node_group" "eks-node-group" {
  cluster_name = aws_eks_cluster.eks-cluster.name

  node_group_name = "eks-node-group"
  node_role_arn   = aws_iam_role.eks-node-group-role.arn

  subnet_ids = [
    aws_subnet.public_subnet_1.id,
    aws_subnet.public_subnet_2.id
  ]

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 1
  }

  disk_size  = 20
  capacity_type  = "ON_DEMAND"
  instance_types = ["t2.small"]

   # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eks_node_group_policy_to_role,
    aws_iam_role_policy_attachment.eks_node_group_policy_to_role_2
  ]

}