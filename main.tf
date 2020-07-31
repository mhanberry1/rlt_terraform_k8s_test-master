provider "google" {
	credentials = file("account.json")
	project = var.project
	region = var.region 
}

# Create the kubernetes cluster

resource "google_container_cluster" "primary" {
	name = "${var.project}-gke-cluster"
	location = var.region
	remove_default_node_pool = true
	initial_node_count = 1

	master_auth {
		username = ""
		password = ""

		client_certificate_config {
			issue_client_certificate = false
		}
	}
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
	name = "${var.project}-node-pool"
	location = var.region
	cluster = google_container_cluster.primary.name
	node_count = 1

	node_config {
		preemptible = true
		machine_type = "e2-medium"

		metadata = {
			disable-legacy-endpoints = true
		}

		oauth_scopes = [
			"https://www.googleapis.com/auth/logging.write",
			"https://www.googleapis.com/auth/monitoring"
		]
	}
}

# Create the container registry

resource "google_container_registry" "registry" {
	project = var.project
	location = "US"
}
