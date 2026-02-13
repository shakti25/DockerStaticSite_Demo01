# comando para generar nueva versión de la imagen docker
docker build -t static-site-demo:latest .
docker build -t rtoora/demos-repository:1 .
docker build -t rtoora/demos-repository:latest .
docker push rtoora/demos-repository:1
docker push rtoora/demos-repository:latest

# comandos para instalar/desinstalar con docker-compose
docker-compose up -d
docker-compose down

# comando para instalar/desisntalar el chart con helm
helm upgrade --install static-site ./helm/static-site --namespace my-demo-static-site --create-namespace
helm uninstall static-site -n my-demo-static-site

# comando para hacer port forward
kubectl port-forward -n my-demo-static-site service/static-site 8080:80

# Notas
para pruebas en microk8s usar rtoora/demos-repository y para pruebas locales usar static-site-demo