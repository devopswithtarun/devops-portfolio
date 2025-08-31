prefix           = "day6vm"
location         = "uksouth"
vm_count         = 2
admin_username   = "tarunadmin"
# to find ssh key cat ~/.ssh/id_rsa.pub
ssh_public_key_path = "/home/lavith1777/.ssh/id_rsa.pub"
# terraform.tfvars is read by Terraform as part of evaluating your variables, 
# so functions like file() work there just like in .tf files. 
# Terraform will read the file and supply its content as the value for the ssh_public_key variable.
allowed_ssh_cidr = "81.77.226.243/32"