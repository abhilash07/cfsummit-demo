#!/usr/bin/env bash
set -e

pushd "$HOME" > /dev/null
bosh create-env bosh-deployment/bosh.yml --ops-file bosh-deployment/gcp/cpi.yml --ops-file bosh-deployment/uaa.yml --ops-file bosh-deployment/credhub.yml  --ops-file bosh-deployment/experimental/bpm.yml --state bosh-deployment/bosh-state.json --vars-file cfcr/cfcr/director.yml --vars-file cfcr/cfcr/director-secrets.yml --vars-store vars.yml  --var-file gcp_credentials_json=terraform.key.json
popd > /dev/null

source set_bosh_environment.sh

pushd "$HOME/kubo-release" > /dev/null
bosh create-release
bosh upload-release
popd > /dev/null

pushd "$HOME/squid-boshrelease/" > /dev/null
bosh create-release
bosh upload-release
popd > /dev/null

pushd "$HOME/cfcr-jumpbox/" > /dev/null
bosh create-release
bosh upload-release
popd > /dev/null
