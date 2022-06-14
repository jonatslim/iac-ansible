locals {
root_dir = "${abspath(path.root)}"                  //  root is where the file locals.tf is located - C:\Users\jonglim\OneDrive - Cisco\Demo\Terraform\iac-python\devops\tf\
devops_dir = "${dirname(local.root_dir)}"           //  root/ or C:\Users\jonglim\OneDrive - Cisco\Demo\Terraform\iac-python\devops\tf\
project_dir = "${dirname(local.devops_dir)}"        //  /mnt/c/Users/jonglim/OneDrive - Cisco/Demo/Terraform/iac-python/
templates_dir = "${local.root_dir}/templates/"      //  C:\Users\jonglim\OneDrive - Cisco\Demo\Terraform\iac-python\devops\tf\templates
}