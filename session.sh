#doitlive shell: /bin/bash
#doitlive prompt: default
#doitlive speed: 5

bosh -d cfcr -n deploy /home/oslynko/kubo-deployment/manifests/cfcr.yml --ops-file /home/oslynko/kubo-deployment/manifests/ops-files/iaas/gcp/cloud-provider.yml --ops-file cfcr_ops_files/colocate_errand.yml --ops-file cfcr_ops_files/lb.yml --ops-file cfcr_ops_files/add_domain.yml --vars-file /home/oslynko/cfcr/cfcr/director.yml --var deployment_name=cfcr

bosh -d cfcr -n run-errand apply-specs --instance master/0

cat cfcr_ops_files/colocate_errand.yml cfcr_ops_files/add_domain.yml
