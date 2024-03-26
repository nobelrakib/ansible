At first go to terraform folder and run these command to set up infrastructure.
```
terraform init
terraform validate
terraform apply -auto-approve
```

<img width="737" alt="nodelist" src="https://github.com/nobelrakib/ansible/assets/53372696/984fb2e5-4885-4baf-8b2d-6dcfc2540c2a">

Here Node0 is control node from where we are running our ansible script. Node 1 is master node and Node 2 & 3 is considered as worker node.

Now At Node0 install ansible.

```
sudo apt-add-repository ppa:ansible/ansible
sudo apt install ansible
```
Now clone this repo in contol node0 and go to ansible folder and copy pem file at remote from local.

<img width="908" alt="demo" src="https://github.com/nobelrakib/ansible/assets/53372696/cf6b5517-009d-41c8-9622-481a2b2cfc56">

Now run instal-k3.yml at this folder to install kubernetes cluster in Node1,Node2&Node3.

<img width="797" alt="installk3s" src="https://github.com/nobelrakib/ansible/assets/53372696/2bb4029f-f313-4301-8939-925db6d50404">

Now go to master node1 and clone  https://github.com/nobelrakib/Layer7-Loadbalancing-In-KubernetesCluster.git this repo. After cloning now you can go to svc1 and svc2  deployment folder and apply deployment command.

```
kubctl apply -f deployment.yml
```
Let's get cluster,pod & service info.

<img width="842" alt="clusterinfo" src="https://github.com/nobelrakib/ansible/assets/53372696/b91bcfd1-a039-4c8b-9cdf-7fdf16307bf1">

Now ping at these pods from postman.

<img width="621" alt="nginxapi" src="https://github.com/nobelrakib/ansible/assets/53372696/1515a9b5-9b49-4d15-8cb8-db589b6c1a09">

<img width="625" alt="api2" src="https://github.com/nobelrakib/ansible/assets/53372696/daf47669-1876-4927-a90b-943a4ae70d95">

Now go to control node which is node0 and from this node we will go to template folder which is a part of this repo. At template folder there is nginx configuration. Now update the ip address and port and run web.yml ansible script.

<img width="917" alt="nginx" src="https://github.com/nobelrakib/ansible/assets/53372696/4d5106f8-819d-4a8f-bbfa-4840807c714c">

Now try to ping at nginx port from control node.

<img width="623" alt="ap122" src="https://github.com/nobelrakib/ansible/assets/53372696/99a2227d-8fd9-4393-b7c2-e4041e175150">




