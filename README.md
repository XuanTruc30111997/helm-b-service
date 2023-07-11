# Getting Started

## Version
* **1.1.1** Include helm chart
* **1.2.1** Rolling Deployment
* **1.2.1** Canary Deployment

## Ingress
* minikube addons enable ingress
* 

## Push to Docker Registry
* **Build package** mvn package -Dmaven.test.skip
* **Build Docker** docker build -t practice-helm/b-service:1.5.2 .
* **Tag Image** docker tag practice-helm/b-service:1.5.2 <repo>/helm-b-service:1.5.2
* **Push Image** docker push <repo>/helm-b-service:1.5.2

## Helm
* **Helm install:** helm install b-service-dev -n practice-helm ./charts
* **Helm get:** helm ls --all -n practice-helm
* **Helm upgrade:** helm upgrade b-service-dev -n practice-helm ./charts
* **Helm upgrade if not exist do install:** helm upgrade --install b-service-dev -n practice-helm ./charts
* **Helm rollback to previous version:** helm rollback b-service-dev 1 -n practice-helm
* **Helm uninstall:** helm uninstall b-service-dev -n practice-helm
