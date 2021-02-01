data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

locals {
    cluster_domain_name = "${var.prefix}-${data.aws_region.current.name}-${var.elasticsearch_cluster_domain_name}"

    common_tags = {
        Name = local.cluster_domain_name
    }
}