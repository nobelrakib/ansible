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

