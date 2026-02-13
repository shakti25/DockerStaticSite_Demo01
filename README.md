# comandos para instalar/desinstalar con docker-compose
docker-compose up -d
docker-compose down

# comando para instalar/desisntalar el chart con helm
helm upgrade --install static-site ./helm/static-site --namespace my-demo-static-site --create-namespace
helm uninstall static-site -n my-demo-static-site

# comando para hacer port forward
kubectl port-forward -n my-demo-static-site service/static-site 8080:80