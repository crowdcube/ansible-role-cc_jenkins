# Ansible Role Jenkins

Ansible role that installs and configures Jenkins, Docker, Kops, Kubectl and Helm on RHEL/CentOS servers.

## Dependencies

* geerlingguy.java
* geerlingguy.jenkins
* darkraiden.pip
* darkraiden.docker

## Requirements

Requires `curl` to be installed on the server.

## Role Variables

Available variables are listed below, along with default values (see `default/main.yml`):

```yaml
cc_jenkins_github_client_id: yourGHClientIDHere
cc_jenkins_github_client_secret: yourGHClientSecretHere
cc_jenkins_github_organization: yourGHOrganizationNameHere
cc_jenkins_github_administrators: [] #list of Github Administrator IDs
```

Jenkins Github OAuth informations, they are used by the groovy script living in `/var/lib/jenkins/init.groovy.d/github_oauth.groovy`. **NB** in order to work, the script requires the `github-oauth` plugin in order to work.


```yaml
cc_jenkins_credentials:
    git:
        name: myuser
        secret: xyz1235
    aws:
        name: aws_access_key_id
        secret: aws_secret_key_id
```

Credentials must be defined in the format above (you must have `cloudbees-credentials` plugin installed).


```yaml
cc_jenkins_kubectl_version: 1.7.5
```

The kubectl version; it has to match with the Kubernetes master version.

```yaml
cc_jenkins_kops_version: 1.7.0
```

The kops version.

```yaml
cc_jenkins_helm_version: 2.6.1
cc_jenkins_helm_uncompressed_dir: linux-amd64
```

Helm version and name of the uncompressed directory.

```yaml
cc_jenkins_aws_config:
    region: eu-west-1
    output: json
cc_jenkins_aws_credentials:
    id: yourAccessKeyIdHere
    secret: yourSecretKeyHere
```

AWS configuration and credentials used by kops to generate the kube config file.

```yaml
cc_jenkins_k8s_clusters:
    environment:
        name: nameOfTheCluster
        s3: nameOfTheStateBucket
```

Kubernetes clusters information.

```yaml
cc_jenkins_host: http://localhost:8080
```

The Jenkins server host used by its own cli.

```yaml
cc_jenkins_admin:
    user: admin
    token: admin
```

Admin username and token used by the cli.

```yaml
cc_jenkins_plugins: []
```

List of Jenkins plugins to be installed using the cli.

## Test Kitchen

### Install Deps

```bash
$ bundle
```

### Create the VM

```bash
$ bundle exec kitchen create
```

### Converge your role

```bash
$ bundle exec kitchen converge
```

### Run serverspec tests

```bash
$ bundle exec kitchen verify
```

### Destroy the VM

```bash
$ bundle exec kitchen destroy
```

### Run Create/Converge/Verify/Destroy in one command

```bash
$ bundle exec kitchen test
```

### Write your tests

You can write your own test by adding a new file or editing the existing one living in the `test/integration/jenkins/serverspec/localhost` directory. More info about how to write serverspec test can be found [here](http://serverspec.org/).

## Example Playbook

```yaml
- hosts: jenkins
  roles:
    - role: ansible-role-cc_jenkins
```

## License

MIT (Expat) / BSD

## Author Information

This role was created in 2017 by [Davide Di Mauro](https://github.com/darkraiden).
