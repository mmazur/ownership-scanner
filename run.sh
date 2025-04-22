#!/bin/bash

#wget https://raw.githubusercontent.com/mmazur/ownership-scanner/refs/heads/main/requirements.txt
#wget https://raw.githubusercontent.com/mmazur/ownership-scanner/refs/heads/main/src/ownership_scanner.py

#pip install -r requirements.txt

#python ./ownership_scanner.py

#curl -L https://aka.ms/InstallAzureCli | bash

echo "Install CLI"
az aks install-cli

echo "Login attempt"
az login --identity --client-id  a0174d3f-5600-4951-b8b8-1f9606fc4546

echo "Get Credentials"
az aks get-credentials --resource-group hcp-underlay-dev-mgmt-1 --name dev-mgmt-1

echo "kubectl test"
kubectl get nodes


