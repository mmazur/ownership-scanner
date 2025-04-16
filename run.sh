#!/bin/bash

#wget https://raw.githubusercontent.com/mmazur/ownership-scanner/refs/heads/main/requirements.txt
#wget https://raw.githubusercontent.com/mmazur/ownership-scanner/refs/heads/main/src/ownership_scanner.py

#pip install -r requirements.txt

#python ./ownership_scanner.py

#curl -L https://aka.ms/InstallAzureCli | bash

echo "Install CLI"
az aks install-cli

echo "Login attempt 1"
az login --identity --object-id  d2becca6-a9cd-41cf-b133-e0c9049b6523

echo "Sleep"
sleep 30

echo "Login attempt 2"
az login --identity --client-id  a0174d3f-5600-4951-b8b8-1f9606fc4546

echo "Get Credentials"
az aks get-credentials --resource-group hcp-underlay-dev-mgmt-1 --name dev-mgmt-1

echo "kubectl test"
kubectl get nodes


