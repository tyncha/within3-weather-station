module "cluster-eks" {
  source = "fuchicorp/eks/aws"
  subnet_ids = ["subnet-", "subnet-"]
  region = "us-east-1"
  ssh_key_location = "${file("~/.ssh/id_rsa.pub")}"
  cluster_name = ""
  cluster_version = "1.15"
  instance_type = ""
  node_desired_capacity = ""
  node_min_size = ""
  node_max_size = ""
  security_group_ids = ["sg-"]
}