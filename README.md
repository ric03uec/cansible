# cansible

[![Run Status](https://api.shippable.com/projects/5afd82bed9a4de0700aa0e34/badge?branch=master)](https://app.shippable.com/github/ric03uec/cansible)

## motivation
after trying out a **lot** of [ansible](https://github.com/ansible/ansible)
containers that were missing one or more functionalities I needed, I decided to
come up with this solution. The objective of this project are
- to have a drop-in replacement for `ansible-playbook` command with sane (overridable) defaults
- to get rid of all dependency issues when installing ansible on the host by
  having `docker` as the only dependency
- to follow best practices to create playbooks as [recommended](http://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html) by `ansible`

## usage

1. install docker for your distribution using instructions [here](https://docs.docker.com/install/)

2. create your project directory structure based on best practices [here](http://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html#directory-layout)

3. run `cansible` with your playbook, assuming following directory layout
```
/my/project/
            |_ playbook.yml
```

```
$ cd /my/project/
$ docker run -v $(pwd):/ansible ric03uec/cansible:master playbook.yml
```
