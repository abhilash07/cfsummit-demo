#!/usr/bin/env bash

#doitlive shell: /bin/bash
#doitlive prompt: default
#doitlive speed: 15
#doitlive commentecho: true

#Deploy second cluster named cfcr-staging
bosh -d cfcr-staging -n deploy "$HOME/kubo-deployment/manifests/cfcr.yml" \
    --ops-file "$HOME/kubo-deployment/manifests/ops-files/iaas/gcp/cloud-provider.yml" \
    --ops-file cfcr_ops_files/colocate_errand.yml \
    --ops-file cfcr_ops_files/expose_links.yml \
    --ops-file cfcr_ops_files/rename_deployment.yml \
    --var director_name=cfsummit-bosh \
    --var project_id=cf-pcf-kubo \
    --var network=cfsummit \
    --var deployment_name=cfcr-staging

#Run default workloads
bosh -d cfcr-staging -n run-errand apply-specs --instance master/0

cat cfcr_ops_files/expose_links.yml 
cat cfcr_ops_files/rename_deployment.yml

#Deploy JumpBox
bosh -n -d cfcr-jumpbox deploy jumpbox_manifest/cfcr-jumpbox.yml

less jumpbox_manifest/cfcr-jumpbox.yml
