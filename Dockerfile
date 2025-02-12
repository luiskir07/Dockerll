# Usar una imagen base de nginx
FROM nginx:latest

# Copiar el archivo HTML al directorio apropiado en el contenedor
COPY html /usr/share/nginx/html/

# Exponer el puerto 80 para el servidor web
EXPOSE 80

RUN echo 'server { \
    listen 80; \
    server_name localhost; \
    location / { \
        root /usr/share/nginx/html; \
        index index.html index.htm; \
        expires -1; \
        add_header Pragma "no-cache"; \
        add_header Cache-Control "no-store, no-cache, must-revalidate, proxy-revalidate, max-age=0"; \
    } \
}' > /etc/nginx/conf.d/default.conf