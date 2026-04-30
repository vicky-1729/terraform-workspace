# module is about create the ec2 instance resoucre

## inputs
1. `ami_id` this (optional) ,that deafult value of ami id: ami-0220d79f3f480ecf5
2. `instance_type` this (opional), that default value is "t2.micro"  .you need provide (string)
3. `sg_ids` (requried) and you need provide list(string)
4. `tags` (requried) and you need provide map(string)

## output
 if you want public ip ---> `public_ip`
 if you want priavte ip ---> `private_ip`
 if you want instance ip ---> `instance_id`