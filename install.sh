sudo dnf install -y dnf-plugins-core

sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

sudo dnf -y install terraform
