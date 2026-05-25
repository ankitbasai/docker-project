FROM httpd:latest
RUN groupadd appgroup && useradd appuser && usermod -aG appgroup appuser
WORKDIR /ankit
RUN chown -R appuser:appgroup /ankit
RUN    chown -R appuser:appgroup /usr/local/apache2/logs /usr/local/apache2/conf /usr/local/apache2/htdocs 
COPY  index.html  /usr/local/apache2/htdocs
COPY  httpd.conf /usr/local/apache2/conf
EXPOSE 2030
USER  appuser

