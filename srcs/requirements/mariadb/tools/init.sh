#!/bin/sh
chown -R mysql:mysql /var/lib/mysql

sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s|#port|port |" /etc/mysql/mariadb.conf.d/50-server.cnf

# init
service mysql start

mysql --user=$MARIADB_ROOT << EOF
USE mysql;
FLUSH PRIVILEGES;

UPDATE mysql.user SET Password=PASSWORD('$MARIADB_ROOT_PASSWORD') WHERE User='$MARIADB_ROOT';
UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE user = 'root' AND host = 'localhost';
FLUSH PRIVILEGES;

DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='$MARIADB_ROOT' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
FLUSH PRIVILEGES;
EOF

mysql --user=$MARIADB_ROOT --password=$MARIADB_ROOT_PASSWORD << EOF
USE mysql;
FLUSH PRIVILEGES;

CREATE DATABASE IF NOT EXISTS $MARIADB_DB;
CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO '$MARIADB_ROOT'@'%' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON $MARIADB_DB.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

sleep 10

service mysql stop

sleep 10

exec /usr/sbin/mysqld -u $MARIADB_ROOT