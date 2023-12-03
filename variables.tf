variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

locals {
  autoscaling_http ={
    desired_capacity = "2"
    max_size         = "5"
    min_size         = "2"
  }
}