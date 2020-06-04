#!/bin/bash

SERVICE=$1

if [ ! -n "$SERVICE" ]
then
	echo "$0 - Error \$SERVICE not set or NULL"
else
  echo Eliminar todo el servicio de $SERVICE
  echo "Deployments"
  kubectl get deployments --namespace shared-fraudprevention $SERVICE
  echo "Services"
  kubectl get services --namespace shared-fraudprevention $SERVICE
  echo "Ingress"
  kubectl get ingress --namespace shared-fraudprevention $SERVICE

  echo "Eliminando Deployments"
  kubectl delete deployment --namespace shared-fraudprevention $SERVICE
  echo "Eliminando Services"
  kubectl delete service --namespace shared-fraudprevention $SERVICE
  echo "Eliminando Ingress"
  kubectl delete ingress --namespace shared-fraudprevention $SERVICE
fi



