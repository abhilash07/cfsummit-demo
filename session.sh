# Recorded with the doitlive recorder
#doitlive shell: /bin/bash
#doitlive prompt: default
#doitlive speed: 5
set -x

bosh -d cfcr -n deploy /home/oslynko/kubo-deployment/manifests/cfcr.yml --ops-file cfcr_ops_files/colocate_errand.yml --ops-file cfcr_ops_files/deploy_quicker.yml --ops-file cfcr_ops_files/expose_links.yml

bosh -d cfcr -n run-errand apply-specs --instance master/0
read -n 1

cat cfcr_ops_files/*
