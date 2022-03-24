# python-counter

How it works
-------------

My application consist of a load balancer which receives the GET request from users and send the request to one of 3 web application pods. Web pod stores the get request in Redis pod and returns the total GET request count to users.



Steps to deploy the counter application in Minikube ( local or cloud)
-----------------------------------------------------------------------

1. Clone my Git repository where code is pushed.

   git clone https://github.com/abhijithkutty/python-redis-counter.git

2. Go inside the repository and execute web-launch shell script.

   sh web-launch.sh

3. Access the application using the displayed URL.
 
   curl -v [URL]



Steps to setup Prometheus & Grafana using Helm Chart.
------------------------------------------------------

1. Install helm chart from Helm Repository

   helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
   helm repo add stable https://charts.helm.sh/stable
   helm repo update
   helm install prometheus prometheus-community/kube-prometheus-stack

2. Port forward the Prometheus service to 9090 when pod starts running.

   kubectl port-forward service/prometheus-kube-prometheus-prometheus 9090 

3. Port forward the Grafana service to 3000 when pod starts running.
   
   kubectl port-forward deployment/prometheus-grafana 3000

4. You can access Grafana for monitoring K8 cluster.

   http://[publicip]/[localhost]:3000
   

  

Additionally, Steps to deploy the counter application in AWS EKS.
-------------------------------------------------------------------

1. Create an IAM user with full administrator programmatic access. Secure access key and secret key.

2. Install AWS CLI, kubectl & eksctl. 

3. Login to EC2, configure IAM user using aws configure, enter Access key and secret key.

4. Create EKS cluster

   eksctl create cluster --name web-counter --version 1.21 --region us-east-1 --nodegroup-name standard-workers --node-type t3.micro --nodes 3 --nodes-min 1 --nodes-max 4 --managed
   
  
    It will take 10–15 minutes since it's provisioning the control plane and worker nodes, attaching the worker nodes to the control plane, and creating the VPC,       security group, and Auto Scaling group.

5. Connect to the cluster

   aws eks update-kubeconfig --name web-counter --region us-east-1

6. Clone my Git repository where code is pushed.

   git clone https://github.com/abhijithkutty/python-redis-counter.git

7. Go inside the repository and execute eks-launch shell script.
   
   sh eks-launch.sh

8. Access the application using http://[Loadbalancer service external ip]/counter


What I like about my solution
-----------------------------

1. My application is highly available, scable and fault tolerant solution when deployed in cloud. I preferred AWS EKS.
2. No chance of losing request messages.


What I dislike about my solution
-------------------------------
1. EKS setup may require some tweaks to access the application in lab.


Testing 1072 Training


