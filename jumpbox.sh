bosh -n -d cfcr-jumpbox deploy jumpbox_manifest/cfcr-jumpbox.yml
gcloud compute instances list --filter="name=$(bosh -d cfcr-jumpbox vms --column vm_cid)"
