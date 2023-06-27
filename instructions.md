## X-Lab Platform Engineer Interview
Platform engineers at X-Lab are responsible for operational resilience and developer experience. Terraform plays a big part in how we build scalable, resilient systems, and make it easy for developers to own their own instrastructure in a "you build it, you run it" fashion.

This exercise is designed to test your Terraform skills and your understanding of how to write clean, easy to understand code, and that you can document how to use what you've built.

### Prerequisites

> **Warning**:
> If you're running this on Windows via WSL, there may be some additional work to get this solution running. We recommend you use Windows directly, or MacOS.

> **Note**: 
> If you're running Windows, you'll need to install VirtualBox instead of Hyper-V

- Install the [vagrant prerequisites](https://learn.hashicorp.com/tutorials/vagrant/getting-started-index#prerequisites)


> **Warning**:
> If you are using an M1 Mac then you'll need to install Multipass, as follows:


- Install the latest [Multipass](https://github.com/canonical/multipass/releases) release for your OS
- [Multipass provider for vagrant](https://github.com/Fred78290/vagrant-multipass)
    - [Install the plugin](https://github.com/Fred78290/vagrant-multipass#plugin-installation)
    - [Create the multipass vagrant box](https://github.com/Fred78290/vagrant-multipass#create-multipass-fake-box)

## Running the exercise

Now that you've installed the prerequisites for your OS, you're ready to run the exercise:    

- Open a terminal and navigate to the root of the assignment directory
- Run the `vagrant up` command
- Once the Vagrant image has started you should see a successful terraform apply:
```
    xlab-interview: kubernetes_service.dev_nginx: Creation complete after 0s [id=dev/nginx-example]
    xlab-interview: kubernetes_service.stg_nginx: Creation complete after 0s [id=dev/staging-nginx]
    xlab-interview: 
    xlab-interview: Apply complete! Resources: 5 added, 0 changed, 0 destroyed.
```
- `vagrant ssh` will get you into the environment
- `curl http://localhost:30201 -I` should return a 200 success:
```
HTTP/1.1 200 OK
...
```
You can also run a `kubectl get svc -n dev` to get the port number for all running services

## The challenge

As your company grows you need to add support for more environments to your kubenetes cluster. For now, all environments will remain on the same cluster, but the Terraform code is becoming difficult to maintain. We would like you to:
* Improve the terraform to make it easy to add new environments
* Ensure that each environment is able to run a different version of the container image
* Add a new environment called `production`
* Add a README containing:
    * Instructions on how to run the updated solution
    * Your design decisions
    * How this could work in a CI/CD pipeline
    * Any other considerations for production deployment

You should do this in your own (public) repo and send us a link to it once complete. If you'd prefer to use a private repository, make sure you grant access to `xlab-platform-interview`

## Guidance

> **Note**: 
> This is a test of your terraform knowledge and no prior kubernetes knowledge is required. The Kubernetes deployment resources will work as-is and should only be used for guidance

* You should be able to complete this task using standard Terraform. Please refrain from using tools that extend terraform's functionality e.g. terragrunt
* Please amend files in `./tf`, `./run.sh` & `./kind-config.yaml` only
* Consider environment segregation and structure your code accordingly
* For extra credit consider tests and how this might fit into CI, and provide examples
