#!/usr/bin/env python3

from azure.identity import ManagedIdentityCredential
from azure.mgmt.containerservice import ContainerServiceClient

from kubernetes import config, client

import yaml



USER_ASSIGNED_CLIENT_ID = "d2becca6-a9cd-41cf-b133-e0c9049b6523"
RESOURCE_GROUP = "hcp-underlay-dev-mgmt-1"
AKS_CLUSTER_NAME = "dev-mgmt-1"

def main():
    subscription_id = "1d3378d3-5a3f-4712-85a1-2485495dfc4b"

    runbook_name = 'Ownership Scanner Runbook'    
    print(f"'{runbook_name} started'\n")

    aks_client = ContainerServiceClient(
        credential=ManagedIdentityCredential(client_id=USER_ASSIGNED_CLIENT_ID),
        subscription_id=subscription_id
    )
    print("Client created")

    response = aks_client.managed_clusters.list_cluster_user_credentials(RESOURCE_GROUP, AKS_CLUSTER_NAME)
    print("credentials listed")

    kubeconfig = yaml.safe_load(response.kubeconfigs[0].value.decode("utf-8"))

    config.load_kube_config_from_dict(kubeconfig)

    # Initialize Kubernetes API client
    v1 = client.CoreV1Api()
    print("aks connected to")

    namespaces = v1.list_namespace()
    for ns in namespaces.items:
        print(f"Namespace: {ns.metadata.name}")
    
    print(f"\n'{runbook_name}' finished")


if __name__== "__main__":
    main()
