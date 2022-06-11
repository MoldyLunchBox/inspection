 service  mysql start

echo "CREATE USER IF NOT EXISTS 'wpuser'@'%' identified by 'root123'" | mysql -u root
echo "GRANT ALL PRIVILEGES ON * . * TO 'wpuser'@'%' identified by 'root123'" | mysql -u root
echo "FLUSH PRIVILEGES" | mysql -u root

echo "-----------------------------------"

echo "CREATE DATABASE wpdb" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

echo "-----------------------------------"

echo "ALTER USER 'root'@localhost IDENTIFIED BY 'root123';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "-----------------------------------"

kill `cat /var/run/mysqld/mysqld.pid`

mysqld_safe