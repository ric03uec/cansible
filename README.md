# cansible

[![Run Status](https://api.shippable.com/projects/5afd82bed9a4de0700aa0e34/badge?branch=master)](https://app.shippable.com/github/ric03uec/cansible)

## motivation
after trying out a **lot** of [ansible](https://github.com/ansible/ansible)
containers that were missing one or more functionalities I needed, I decided to
come up with this solution. The objective of this project are to
- have a drop-in replacement for `ansible-playbook` command with sane (and overridable) defaults
- get rid of all dependency issues when installing ansible on the host by
  having `docker` as the only dependency
- follow best practices to create playbooks as [recommended](http://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html) by `ansible`

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

### Using keys

- add all the keys in `keys` directory in the project root. Since the project
  folder is mounted at path `/ansible` inside the container, the keys will be
  available to the playbooks and inventory file(s).


```
/my/project/
            |_ playbook.yml
            /keys/
                |_ mykey.public
                |_ mykey.private
```

- these can be used in the inventory file using `ansible_ssh_private_key_file=/ansible/keys/mykey.private`
