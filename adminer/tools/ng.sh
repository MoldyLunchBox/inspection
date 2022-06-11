
sed -i '/date.timezone/c date.timezone = America/Chicago'  /etc/php/7.3/fpm/php.ini
sed -i '/upload_max_filesize/c upload_max_filesize = 32M'  /etc/php/7.3/fpm/php.ini
sed -i '/max_execution_time/c max_execution_time = 300'  /etc/php/7.3/fpm/php.ini
sed -i '/post_max_size/c post_max_size = 64M'  /etc/php/7.3/fpm/php.ini
openssl req  -nodes -new -x509 -days 3650 -keyout /etc/ssl/inception.key -out /etc/ssl/inception.crt -subj "/C=MA/ST=KH/L=khouribga/O=1337/OU=Org/CN=www.1337.ma"

/etc/init.d/php7.3-fpm start 