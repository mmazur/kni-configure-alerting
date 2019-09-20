#!/bin/bash
. ~/dev/asciinema-scripter/scripter.sh
oc delete -f demo/demo1-secrets.yaml >/dev/null
clear
export LC_ALL=C

TYPE_SPEED=20
AUTO_SLEEP=2

function narrate() {
  printf "# ${PURPLE}${1}${CRESET}\n"
  prompt
}

prompt "[${RED}demo1${CRESET}]$ "

narrate "Show current (empty) alertmanager config"
TYPE_SPEED=26 pe "oc -n openshift-monitoring get secret alertmanager-main --template='{{ index .data \"alertmanager.yaml\" }}' |base64 -d|pygmentize -l yaml"


narrate "Create SREConfig CR, so the operator can do its thing"
pe "pygmentize demo/demo1-cr.yaml"
sleep 3
pe "oc apply -f demo/demo1-cr.yaml"


pe "sleep 10"


narrate "Compare results"
TYPE_SPEED=26 pe "oc -n openshift-monitoring get secret alertmanager-main --template='{{ index .data \"alertmanager.yaml\" }}' |base64 -d|pygmentize -l yaml"


narrate "More details of the underlying configure-alertmanager-operator"
AUTO_SLEEP=0
pe "oc get -n openshift-operator-lifecycle-manager catalogsource/configure-alertmanager-operator-registry"
pe "oc get -n openshift-monitoring subscription"
pe "oc get -A all 2>&1|grep configure.alert|column -t"

sleep 3
