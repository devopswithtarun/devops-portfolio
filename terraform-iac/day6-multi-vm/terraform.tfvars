prefix         = "day6vm"
location       = "uksouth"
vm_count       = 2
admin_username = "tarunadmin"
# to find ssh key cat ~/.ssh/id_rsa.pub
ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCxhsZlSiZVDKqu4tF8efIfIKiccsIdGSOFDmGMz1sx6TvrKuSoPslVqbYhFBvh4KCr2cFez6KJGHXwKe/G7vep++vva774Su9MfKK9lXywF7vHUB8S13rQeDn9gkgKMhEafy2bBXjbUZsoibQwJHcsP/xpq+Ms144qizCKhXAXDeVcWdJAcgJp16p9hvjccwWnPTqqkNh/07vtAQAOfACcO8JtwLrMF9I2JOmo7PciAxIWVr2jBpcbiefzQWryDuZ737rsTRCJvgfZA2wCVXn0Zcei+NfX7ws7m1kglk6Qx5UkMvUp5rVRYIFnDmK5q61M3uhm8e2hxxeF7ygHqyQXXwr1/lLBgi+42W0HW38wo1SY0x2rdVO73MxXx51b/xSDFhX5mddR/882Bgw9JtRaBQu/fuA8zsHI3riAN6LzYuT+0HNLRsHvOfBUDn4Z/94574ilJNj+sKpkJt+wBAAkm5OfSrNbPZpDlHLHbBr3yBGSRYof1SXDK/SKIt3CyO9hsaqSUbRzwQZGLlU4UpTwrt9r8Ng0VkffK09H14ol3UH7aRELKWNdeLB9YIIlWzHkYsVKNnO4vVNO83JHDjAPTCsUTtosGGYTTwCy3jIGt8bBdDHPeGH4aalls1fLsATEKLDmwBQ1nfcJRgi0SwKVBeWtiVZEq50L5iJ0QNK9Pw== lavith1777@TarunAnu"
# terraform.tfvars is read by Terraform as part of evaluating your variables, 
# so functions like file() work there just like in .tf files. 
# Terraform will read the file and supply its content as the value for the ssh_public_key variable.
allowed_ssh_cidr = "81.77.226.243/32"