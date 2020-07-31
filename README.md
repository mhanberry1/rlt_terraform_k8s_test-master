# rlt_terraform_k8s_test
This repo holds the assets needed for our Terraform, Kubernetes, And Helm coding test

## Test Overview
The purpose of this test is to demonstrate your knowledge in the following areas: 
* GCP
* Terraform
* Kubernetes (GKE)
* Helm

This repo holds the application code and Dockerfile in the "application" directory. The helm chart to be used to deploy the application to the Kubernetes cluster is the "charts" directory. 

## Test Instructions
1) Create Terraform code to deploy a Kubernetes cluster inside of GCP. 
2) Build rlt-test application image and push GCR
3) Deploy the helm chart included in the repo into the kubernetes cluster.  
4) Fix any issues that may be present in the helm chart.
5) Expose the application to the outside world.  

**You will have 48 hours to get as much of this test done as possible. Once complete please commit your code to your one repo and send an email at codingtest@rootleveltech.com. In the email please include your first and last name, as well as a link to your git repo holding your code for this test. If you have any questions or need further clarifications please reach back out to us at codingtest@rootleveltech.com**


## Bonus
1) Make the kubernetes cluster private
2) Deploy multiple environments for the application, within the same Kubernetes cluster. (production and stage)
3) Configure monitoring/alerts for the Kubernetes cluster. 
4) Use istio 
5) Use FQDN for service
6) Stand up a second environment for the infrastructure in Terraform. 

## Additional Comments
* Please be prepared to talk through your design decisions with us. We have left the instructions pretty vague, to let you take the end goal, and come up with the solution on your own. 
* If you are unable to complete all tasks in this test its not a deal breaker, but please do you best. If you run out of time and are unable to finish the code, please try to write in psuedo code or written language how you would approach the issues you were unable to finish.
* We would like for this to be as close to a single command deployment as possible (terraform, and the helm deploy). 
* We would also like for you to tackle this as you would a production ready deployment. We understand that time may not permit production like deploys in all areas, in this scenario please note what you would do different in a production environment.





