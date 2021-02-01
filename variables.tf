variable "prefix" {
    description = "The environment to deploy resources to. [PROD, STAGING, DEV]"
    type        = string
}

variable "custom_tags" {
    description = "The custom tags to be applied to the resources."
    type        = map(string)
    default     = {}
}

variable "elasticsearch_cluster_domain_name" {
    description = "The domain name for the Elasticsearch cluster."
    type        = string
}

variable "elasticsearch_version" {
    description = "The Elasticsearch version to deploy."
    type        = string
}

variable "elasticsearch_cluster_config" {
    description = "The elasticsearch cluster configuration parameters."
    type        = map(string)
    default     = {
        "dedicated_master_enabled"  = true
        "dedicated_master_type"     = "c5.large.elasticsearch"
        "dedicated_master_count"    = 3
        "instance_type"             = "i3.large.elasticsearch"
        "instance_count"            = 6
        "zone_awareness_enabled"    = true
        "availability_zone_count"   = 3
    }
}

variable "sg_list" {
    description = "The list of security groups to be used for the pipeline."
    type        = list(string)
}

variable "subnet_list" {
    description = "The list of subnets to be used for the pipeline."
    type        =list(string)
}