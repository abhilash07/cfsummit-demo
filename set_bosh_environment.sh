#!/usr/bin/env bash

export BOSH_CLIENT=admin BOSH_CA_CERT=$(bosh int $HOME/vars.yml --path /default_ca/ca) BOSH_CLIENT_SECRET=$(bosh int $HOME/vars.yml --path /admin_password) BOSH_ENVIRONMENT=$(bosh int $HOME/cfcr/cfcr/director.yml --path /internal_ip)

