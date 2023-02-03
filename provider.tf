terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"

    }
  }
}

resource "aws_iam_user" "lb" {
    for_each = toset([
        "bob1",
        "sam1",
        "lisa1"
    ])
  name = each.value
}


output list_of_users {
    value = <<EOF


        Today you have created the following users


                "${aws_iam_user.lb["bob1"].arn}"




    EOF
}
variable "tags" {
  type        = map(any)
  description = "Please provide a list of tags"
  default = {
    Dept    = "IT"
    Team    = "DevOps"
    Quarter = "1"
  }
}



variable users {
  type = list 
  description = "Please supply name of the users"
  default = [
    "bob1",
    "sam1",
    "lisa1",    
  ]
}
