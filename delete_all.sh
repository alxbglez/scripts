#!/bin/bash

NAMESPACE=$1
SERVICE=$2

if [ ! -n "$SERVICE" ]
then
	echo "$0 - Error \$SERVICE not set or NULL"
else
    if [ ! -n "$NAMESPACEE" ]
    then
        echo "$0 - Error \$NAMESPACE not set or NULL"
    else
    echo Eliminar todo el servicio de $SERVICE - $NAMESPACE
    echo "Deployments"
    kubectl get deployments --namespace shared-$NAMESPACE $SERVICE
    echo "Services"
    kubectl get services --namespace shared-$NAMESPACE $SERVICE
    echo "Ingress"
    kubectl get ingress --namespace shared-$NAMESPACE $SERVICE

    echo "Eliminando Deployments"
    kubectl delete deployment --namespace shared-$NAMESPACE $SERVICE
    echo "Eliminando Services"
    kubectl delete service --namespace shared-$NAMESPACE $SERVICE
    echo "Eliminando Ingress"
    kubectl delete ingress --namespace shared-$NAMESPACE $SERVICE
    fi
fi