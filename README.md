## Scope

This repository is a very simple creation of an OIDC Connection to EKS Cluster

## Reason

The documentation from AWS around this was average and hard to follow - now it's centralised for myself or someone else to refer back to in the future

## Special Notes

The `aws_eks_identity_provider_config` takes a several minutes to setup - see below for evidence with Terraform:

```

aws_eks_identity_provider_config.this: Still creating... [7m30s elapsed]

```
