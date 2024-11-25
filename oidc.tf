resource "aws_eks_identity_provider_config" "this" {
  cluster_name = aws_eks_cluster.this.name

  oidc {
    client_id                     = "sts.amazonaws.com"
    identity_provider_config_name = "eks-irsa"
    issuer_url                    = aws_eks_cluster.this.endpoint
  }
}

resource "aws_iam_openid_connect_provider" "this" {
  url = aws_eks_cluster.this.identity[0].oidc[0].issuer

  client_id_list = [
    "sts.amazonaws.com",
  ]

  thumbprint_list = [data.tls_certificate.eks.certificates[0].sha1_fingerprint]
}

data "tls_certificate" "eks" {
  url = aws_eks_cluster.this.identity[0].oidc[0].issuer
}