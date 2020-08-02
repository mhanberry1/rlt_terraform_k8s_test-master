# rlt_terraform_k8s_test
This repo holds the assets needed for our Terraform, Kubernetes, And Helm coding test

## Deployment Instructions

### Pre-Requisites

1. Download Terraform 0.12 from [here](https://www.terraform.io/downloads.html)
2. Install Docker as described [here](https://docs.docker.com/get-docker/)
3. Install Cloud SDK from [here](https://cloud.google.com/sdk/docs)
4. Install helm as described [here](https://helm.sh/docs/intro/install/)
5. Install kubctl using `gcloud components install kubectl`
6. Prepare your GCP account
	- If you do not have an account, create it
	- Make sure it is configured with payment information
	- Create a project named `rlt-test`
	- Enable The Kubernetes Engine API for this project
	- Create a service account for the project, and create an account key for it
	- Save the key in the project directory as account.json
	- Give your service account the following IAM roles:
		- Kubernetes Engine Admin
		- Service Account User permissions
		- Compute Admin
		- Storage Admin
7. Configure docker to use gcloud as a credential helper using `gcloud auth configure-docker`
8. Log in to google cloud using `gcloud auth login`
9. Configure the project value in gcloud using `gcloud config set project rlt-test`
10. Get the cluster credentials usind `gcloud container clusters get-credentials rlt-test-gke-cluster --zone us-central1`

### Deploy

1. Build the infrastructure using `terraform apply`
2. Navigate to `application/rlt-test` and build the docker container using `docker build -t us.gcr.io/rlt-test/rlt-test .`
3. Upload the container to GCR using `docker push us.gcr.io/rlt-test/rlt-test`
4. Deploy the helm chart from the root of the repository using `helm install rlt-test charts/rlt-test/`

### Use

You can access the resource using the external ip found by issuing the command `kubectl get service rlt-test`

## Test Overview
The purpose of this test is to demonstrate your knowledge in the following areas: 
* GCP
* Terraform
* Kubernetes (GKE)
* Helm

This repo holds the application code and Dockerfile in the "application" directory. The helm chart to be used to deploy the application to the Kubernetes cluster is the "charts" directory. 

## Test Instructions
1) [x] Create Terraform code to deploy a Kubernetes cluster inside of GCP. 
2) [x] Build rlt-test application image and push GCR
3) [x] Deploy the helm chart included in the repo into the kubernetes cluster.  
4) [x] Fix any issues that may be present in the helm chart.
5) [x] Expose the application to the outside world.  

**You will have 48 hours to get as much of this test done as possible. Once complete please commit your code to your one repo and send an email at codingtest@rootleveltech.com. In the email please include your first and last name, as well as a link to your git repo holding your code for this test. If you have any questions or need further clarifications please reach back out to us at codingtest@rootleveltech.com**


## Bonus
1) [ ] Make the kubernetes cluster private
2) [ ] Deploy multiple environments for the application, within the same Kubernetes cluster. (production and stage)
3) [ ] Configure monitoring/alerts for the Kubernetes cluster. 
4) [ ] Use istio 
5) [ ] Use FQDN for service
6) [ ] Stand up a second environment for the infrastructure in Terraform. 

## Additional Comments
* Please be prepared to talk through your design decisions with us. We have left the instructions pretty vague, to let you take the end goal, and come up with the solution on your own. 
* If you are unable to complete all tasks in this test its not a deal breaker, but please do you best. If you run out of time and are unable to finish the code, please try to write in psuedo code or written language how you would approach the issues you were unable to finish.
* We would like for this to be as close to a single command deployment as possible (terraform, and the helm deploy). 
* We would also like for you to tackle this as you would a production ready deployment. We understand that time may not permit production like deploys in all areas, in this scenario please note what you would do different in a production environment.
