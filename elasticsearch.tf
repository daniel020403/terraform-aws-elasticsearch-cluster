resource "aws_elasticsearch_domain" "elasticsearch" {
    domain_name             = local.cluster_domain_name
    elasticsearch_version   = var.elasticsearch_version

    cluster_config {
        dedicated_master_enabled    = var.elasticsearch_cluster_config["dedicated_master_enabled"]
        dedicated_master_type       = var.elasticsearch_cluster_config["dedicated_master_type"]
        dedicated_master_count      = var.elasticsearch_cluster_config["dedicated_master_count"]
        instance_type               = var.elasticsearch_cluster_config["instance_type"]
        instance_count              = var.elasticsearch_cluster_config["instance_count"]

        zone_awareness_enabled = var.elasticsearch_cluster_config["zone_awareness_enabled"]
        zone_awareness_config {
            availability_zone_count = var.elasticsearch_cluster_config["availability_zone_count"]
        }
    }

    # not needed for i3 instance types
    ebs_options {
        ebs_enabled     = true
        volume_type     = "gp2"
        volume_size     = 35
        # iops            = 1000
    }

    domain_endpoint_options {
        enforce_https       = true
        tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
    }

    encrypt_at_rest {
        enabled     = false
        # kms_key_id  = var.kms_key_id
    }

    node_to_node_encryption {
        enabled = false
    }

    vpc_options {
        security_group_ids  = var.sg_list
        subnet_ids          = var.subnet_list
    }

    tags = merge(local.common_tags, var.custom_tags)
}

resource "aws_elasticsearch_domain_policy" "elasticsearch" {
    domain_name     = aws_elasticsearch_domain.elasticsearch.domain_name
    access_policies = <<POLICIES
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": "es:*",
            "Resource": "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${aws_elasticsearch_domain.elasticsearch.domain_name}/*"
        }
    ]
}
    POLICIES
}