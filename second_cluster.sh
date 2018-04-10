# Recorded with the doitlive recorder
#doitlive shell: /bin/bash
#doitlive prompt: default
#doitlive speed: 5
set -ex

bosh -d cfcr-staging -n deploy /home/oslynko/kubo-deployment/manifests/cfcr.yml --ops-file /home/oslynko/kubo-deployment/manifests/ops-files/iaas/gcp/cloud-provider.yml --ops-file cfcr_ops_files/colocate_errand.yml  --ops-file cfcr_ops_files/expose_links.yml --ops-file cfcr_ops_files/rename_deployment.yml   --vars-file /home/oslynko/cfcr/cfcr/director.yml --var deployment_name=cfcr-staging
bosh -d cfcr-staging -n run-errand apply-specs --instance master/0
read -n 1

cat cfcr_ops_files/expose_links.yml
