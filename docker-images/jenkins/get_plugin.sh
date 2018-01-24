#!/usr/bin/env bash

JENKINS_HOST=test:test@minikube:31485

curl -sSL "http://${JENKINS_HOST}/pluginManager/api/xml?depth=1&xpath=/*/*/shortName|/*/*/version&wrapper=plugins" | perl -pe 's/.*?<shortName>([\w-]+).*?<version>([^<]+)()(<\/\w+>)+/\1 \2\n/g'|sed 's/ /:/'

