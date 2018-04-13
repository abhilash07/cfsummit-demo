#!/usr/bin/env bash

#doitlive shell: /bin/bash
#doitlive prompt: default
#doitlive speed: 5
#doitlive commentecho: true

#Deploy cluster using Kubo deployment and some custom opsfiles
bosh -d cfcr -n deploy "$HOME/kubo-deployment/manifests/cfcr.yml" \
    --ops-file "$HOME/kubo-deployment/manifests/ops-files/iaas/gcp/cloud-provider.yml" \
    --ops-file cfcr_ops_files/colocate_errand.yml \
    --ops-file cfcr_ops_files/add_lb_ip_to_certificate.yml \
    --ops-file cfcr_ops_files/add_mastests_to_lb.yml \
    --var director_name=cfsummit-bosh \
    --var project_id=cf-pcf-kubo \
    --var network=cfsummit \
    --var deployment_name=cfcr

#Deploy base workloads
bosh -d cfcr -n run-errand apply-specs --instance master/0

cat cfcr_ops_files/colocate_errand.yml 
cat cfcr_ops_files/add_mastests_to_lb.yml 
cat cfcr_ops_files/add_lb_ip_to_certificate.yml
