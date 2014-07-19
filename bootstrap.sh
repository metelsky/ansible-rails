#!/bin/sh

# ==============================================================================
#
# Rails Env Installer
#
# The first playbook needs to be run as the root user.
# It will configure basic sever security, enable the firewall and create the deploy user for us
#
# ==============================================================================

set -e

color() {
      printf '\033[%sm%s\033[m\n' "$@"
      }

color '35;1' "

     VAGRANT ANSIBLE RAILS

     For more details, visit:
     https://www.github.com/owainlewis/vagrant-ansible-rails
"

color '35;1' 'Building...'

function run_playbook {
    echo "Running playbook $1"
    ansible-playbook playbooks/$1/setup.yml -i hosts -u vagrant --private-key=~/.vagrant.d/insecure_private_key
}

declare -a playbooks=("base" "node" "nginx" "postgres" "rbenv")

for playbook in "${playbooks[@]}"
do
    run_playbook $playbook
done



