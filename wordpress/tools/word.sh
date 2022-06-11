
sleep 5
wp core config --path=/var/www/wordpress --dbname=wpdb --dbuser=wpuser --dbpass=root123 --dbhost=mariadb  --skip-check --allow-root  --path=/var/www/html/wordpress 
wp core install --url=https://localhost/ --title='Example' --admin_user=supervisor --admin_password=strongpassword --admin_email=info@example.com --path=/var/www/html/wordpress --allow-root 
wp user create NEWUSERNAME ok@ooook.ok --role=subscriber --user_pass=password   --path=/var/www/html/wordpress  --allow-root

wp plugin install redis-cache --activate --path=/var/www/html/wordpress  --allow-root
wp redis update-dropin --path=/var/www/html/wordpress  --allow-root
echo "supervised systemd" >> /etc/redis/redis.conf
echo "maxmemory 128M" >> /etc/redis/redis.conf
echo "maxmemory-policy allkeys-lfu" >> /etc/redis/redis.conf
echo "define( 'WP_REDIS_HOST', '127.0.0.1' );" >> /var/www/html/wordpress/wp-config.php 
echo "define( 'WP_REDIS_PORT', 6379 );" >> /var/www/html/wordpress/wp-config.php 
echo "define( 'WP_REDIS_TIMEOUT', 1 );" >> /var/www/html/wordpress/wp-config.php 
echo "define( 'WP_REDIS_READ_TIMEOUT', 1 );" >> /var/www/html/wordpress/wp-config.php 
echo "define( 'WP_REDIS_DATABASE', 0 );" >> /var/www/html/wordpress/wp-config.php
/etc/init.d/redis-server restart
php-fpm7.3 --nodaemonize 