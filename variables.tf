// private access token to linode cloud
variable "linode_pat_token" {
    sensitive = true
}
// ssh key to access server
variable "authorized_key" {
    sensitive = true
}
// root password
variable "root_user_pw" {
    sensitive = true
}
// default number of servers to spin up.
variable "ansible_count" {
    default = 5
}