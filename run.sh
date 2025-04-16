#!/bin/bash

#wget https://raw.githubusercontent.com/mmazur/ownership-scanner/refs/heads/main/requirements.txt
#wget https://raw.githubusercontent.com/mmazur/ownership-scanner/refs/heads/main/src/ownership_scanner.py

#pip install -r requirements.txt

#python ./ownership_scanner.py

#curl -L https://aka.ms/InstallAzureCli | bash

az aks install-cli

az login --debug --identity --object-id  d2becca6-a9cd-41cf-b133-e0c9049b6523

az aks get-credentials --resource-group hcp-underlay-dev-mgmt-1 --name dev-mgmt-1

kubectl get nodes


