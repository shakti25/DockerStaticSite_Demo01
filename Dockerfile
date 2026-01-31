# Usa la imagen oficial de Nginx Alpine (más ligera)
FROM nginx:alpine

# Copia los archivos estáticos al directorio de Nginx
COPY index.html /usr/share/nginx/html/
COPY css/ /usr/share/nginx/html/css/
COPY js/ /usr/share/nginx/html/js/

# Expone el puerto 80
EXPOSE 80

# El comando por defecto ya está definido en la imagen base de Nginx
CMD ["nginx", "-g", "daemon off;"]
