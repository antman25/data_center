#!/bin/bash

# SERVICE is the name of the Vault service in Kubernetes.
# It does not have to match the actual running service, though it may help for consistency.
SERVICE=vault-server-tls

# NAMESPACE where the Vault service is running.
NAMESPACE=vault

# SECRET_NAME to create in the Kubernetes secrets store.
SECRET_NAME=vault-server-tls

# TMPDIR is a temporary working directory.
TMPDIR=/tmp

CSR_NAME=vault-csr

serverCert=$(minikube kubectl -- get csr ${CSR_NAME} -o jsonpath='{.status.certificate}')

echo "${serverCert}" | openssl base64 -d -A -out ${TMPDIR}/vault.crt

minikube kubectl --  config view --raw --minify --flatten -o jsonpath='{.clusters[].cluster.certificate-authority-data}' | base64 -d > ${TMPDIR}/vault.ca

minikube kubectl -- create namespace ${NAMESPACE}

minikube kubectl --  create secret generic ${SECRET_NAME} \
        --namespace ${NAMESPACE} \
        --from-file=vault.key=${TMPDIR}/vault.key \
        --from-file=vault.crt=${TMPDIR}/vault.crt \
        --from-file=vault.ca=${TMPDIR}/vault.ca
