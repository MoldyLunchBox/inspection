
select user , password from mysql.user where user='wpuser';


wp config set WP_REDIS_PATH --raw "__DIR__ . '/../redis.sock'"  --path=/var/www/html/wordpress  --allow-root


$ wp config set WP_REDIS_SCHEME "unix"  --path=/var/www/html/wordpress  --allow-root
