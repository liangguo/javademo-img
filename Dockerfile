FROM nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY target/img.tar /img.tar
RUN mkdir -p /img
RUN tar xvf /img.tar -C /