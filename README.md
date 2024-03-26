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



