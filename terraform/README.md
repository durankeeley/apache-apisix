# terraform-apache-apisix

## Install Terraform
```alias terraform='docker run --rm -it -w $PWD -v $PWD:$PWD --user=$(id -u):$(id -g) hashicorp/terraform:latest'```

## Deploy Configuration
Copy the ```secret.tfvars.example``` to ```secret.tfvars```
To run use the following to get the dependancies ```terraform init``` and then ```terraform apply -var-file="secret.tfvars"```
