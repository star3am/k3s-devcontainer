#!/bin/bash
# This file contains the functions for installing Kubernetes-Play.
# Each function contains a boolean flag so the installations
# can be highly customized.
# Original file located https://github.com/dynatrace-wwse/kubernetes-playground/blob/main/cluster-setup/functions.sh


# FUNCTIONS DECLARATIONS
timestamp() {
  date +"[%Y-%m-%d %H:%M:%S]"
}

printInfo() {
  echo -e '\e[38;5;198m'"[dev.container|INFO] $(timestamp) |>->-> $1 <-<-<|"
}

printInfoSection() {
  echo -e '\e[38;5;198m'"[dev.container|INFO] $(timestamp) |$thickline"
  echo -e '\e[38;5;198m'"[dev.container|INFO] $(timestamp) |$halfline $1 $halfline"
  echo -e '\e[38;5;198m'"[dev.container|INFO] $(timestamp) |$thinline"
}

printWarn() {
  echo  -e '\e[38;5;226m'"[dev.container|WARN] $(timestamp) |x-x-> $1 <-x-x|"
}

printError() {
  echo -e '\e[38;5;196m'"[dev.container|ERROR] $(timestamp) |x-x-> $1 <-x-x|"
}


waitForAllPods() {
  # Function to filter by Namespace, default is ALL
  if [[ $# -eq 1 ]]; then
    namespace_filter="-n $1"
  else
    namespace_filter="--all-namespaces"
  fi
  RETRY=0
  RETRY_MAX=60
  # Get all pods, count and invert the search for not running nor completed. Status is for deleting the last line of the output
  CMD="kubectl get pods $namespace_filter 2>&1 | grep -c -v -E '(Running|Completed|Terminating|STATUS)'"
  printInfo "Checking and wait for all pods in \"$namespace_filter\" to run."
  while [[ $RETRY -lt $RETRY_MAX ]]; do
    pods_not_ok=$(eval "$CMD")
    if [[ "$pods_not_ok" == '0' ]]; then
      printInfo "All pods are running."
      break
    fi
    RETRY=$(($RETRY + 1))
    printWarn "Retry: ${RETRY}/${RETRY_MAX} - Wait 10s for $pods_not_ok PoDs to finish or be in state Running ..."
    sleep 10
  done

  if [[ $RETRY == $RETRY_MAX ]]; then
    printError "Following pods are not still not running. Please check their events. Exiting installation..."
    kubectl get pods --field-selector=status.phase!=Running -A
    exit 1
  fi
}