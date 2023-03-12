resource "aws_iam_role" "eks-role" {
  name = "eks-role"

  assume_role_policy = <<POLICY
{
"Version": "2012-10-17",
"Statement": [
    {
        "Effect": "Allow",
        "Principal": {
            "Service": "eks.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
    }
]
}
POLICY
}

resource "aws_iam_role" "eks-node-group-role" {
  name = "eks-node-group-role"

  assume_role_policy = <<POLICY
{
"Version": "2012-10-17",
"Statement": [
    {
        "Effect": "Allow",
        "Principal": {
            "Service": "ec2.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
    }
]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy_to_role" {
  role = aws_iam_role.eks-role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "eks_node_group_policy_to_role" {
  role = aws_iam_role.eks-node-group-role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "eks_node_group_policy_to_role_2" {
  role = aws_iam_role.eks-node-group-role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "eks_node_group_policy_to_role_3" {
  role = aws_iam_role.eks-node-group-role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_user" "external-secret-user" {
  name = "external-secret"
}