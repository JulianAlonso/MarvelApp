#!/bin/bash

# set -xo pipefail

ENVIRONMENT_PATH=App/Sources

ENVIRONMENT_FILENAME=Environment.swift
ENVIRONMENT_TEMPLATE_FILENAME=Environment.swift.template

ENVIRONMENT_FILE=$ENVIRONMENT_PATH/$ENVIRONMENT_FILENAME
ENVIRONMENT_TEMPLATE=$ENVIRONMENT_PATH/$ENVIRONMENT_TEMPLATE_FILENAME


install_tuist() {
    bash <(curl -Ls https://install.tuist.io)
}

generate_project() {
    tuist generate
}

update_carthage() {
    if which /usr/local/bin/carthage >/dev/null; then 
        carthage bootstrap --platform iOS --cache-builds
    else 
        echo "Error: Carthage not installed, please install it"
        exit 1
    fi
}

check_environment() {
    if ! [ -f "$ENVIRONMENT_FILE" ]; then
        echo "Creating App/Sources/Enviroment.swift file based on App/Sources/Environment.swift.template"
        echo "$(tput bold)Remember to put your keys on it$(tput sgr0)"
        cp $ENVIRONMENT_TEMPLATE $ENVIRONMENT_FILE
    fi
}

install_tuist
update_carthage
check_environment
generate_project


exit 0