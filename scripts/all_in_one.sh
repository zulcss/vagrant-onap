#!/bin/bash

set -o xtrace

source /var/onap/functions
source /var/onap/aai
source /var/onap/mso
source /var/onap/message_router
source /var/onap/robot
source /var/onap/vid
source /var/onap/sdnc

configure_dns
create_configuration_files
install_dev_tools
install_java
install_bind
configure_bind
install_maven
install_docker_engine
install_docker_compose

for serv in aai mso mr robot vid sdnc; do
    configure_service ${serv}_serv.sh
    init_${serv}
done
