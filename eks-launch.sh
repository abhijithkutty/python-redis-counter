#!bin/bash
kubectl apply -f web-service.yaml
kubectl apply -f redis-service.yaml 
kubectl apply -f web-deployment.yaml
VAR=$(kubectl get pod)
echo "\n\nPOD STATUS\n\n $VAR"
echo "\n\nYou can access the application here when pods start running : <LoadBalancer External IP>/30080/counter \n\n"
