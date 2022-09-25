az login
az account show
aks get-credentials --resource-group rg-unyleya --name aks-unyleya

kubectl config get-contexts
kubectl config use-context
kubectl config delete-cluster 
kubectl config delete-context

kubectl get nodes

kubectl apply -f .\azure-vote-all-in-one-redis.yaml
kubectl delete -f .\azure-vote-all-in-one-redis.yaml

kubectl get all

helm create azure-vote-all-in-one-redis
helm install azure-vote .\azure-vote-all-in-one-redis\ --debug  --dry-run
helm install azure-vote .\azure-vote-all-in-one-redis\
helm upgrade azure-vote .\azure-vote-all-in-one-redis\
helm uninstall  azure-vote .\azure-vote-all-in-one-redis\ 

helm list
