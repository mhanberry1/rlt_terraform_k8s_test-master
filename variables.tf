variable "region" {
	description = "Where the gcp resources will be deployed"
	default = "us-central1"
}

variable "project" {
	description = "The name of the gcp project and the base name for all resources"
	default = "rlt-test"
}
