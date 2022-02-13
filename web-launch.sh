#!bin/bash
kubectl apply -f web-service.yaml
kubectl apply -f redis-service.yaml 
kubectl apply -f web-deployment.yaml
POD=$(kubectl get pod | grep counter) 
VAR=$(minikube service web-counter --url)
echo "\nPOD STATUS \n$POD"
echo "\n\nYou can access the application here when pods start running : $VAR/counter \n\n"
echo "\n\nIf you are using cloud VM, you can access the application here: http://<public ip>/counter \n\n"