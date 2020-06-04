#!/bin/bash

while getopts n:s: option
do
case "${option}"
in
n) NAMESPACE=${OPTARG};;
s) SERVICE=${OPTARG};;
esac
done

if [ ! -n "$NAMESPACE" ]
then
    echo "$0 - Error \$NAMESPACE not set or NULL"
else
    echo $SERVICE :: shared-$NAMESPACE
    echo "Deployments"
    kubectl get deployments --namespace shared-$NAMESPACE $SERVICE
    echo "Services"
    kubectl get services --namespace shared-$NAMESPACE $SERVICE
    echo "Ingress"
    kubectl get ingress --namespace shared-$NAMESPACE $SERVICE
fi