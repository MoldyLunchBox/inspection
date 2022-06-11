 service  mysql start

echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' identified by '${MYSQL_ROOT_PASSWORD}'" | mysql -u root
echo "GRANT ALL PRIVILEGES ON * . * TO '${MYSQL_USER}'@'%' identified by '${MYSQL_ROOT_PASSWORD}'" | mysql -u root
echo "FLUSH PRIVILEGES" | mysql -u root

echo "-----------------------------------"

echo "CREATE DATABASE ${MYSQL_DB}" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

echo "-----------------------------------"

echo "ALTER USER 'root'@localhost IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "-----------------------------------"

kill `cat /var/run/mysqld/mysqld.pid`

mysqld_safe