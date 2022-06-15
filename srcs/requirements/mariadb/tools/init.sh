#!/bin/sh
chown -R mysql:mysql /var/lib/mysql

sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s|#port|port |" /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

# init

mysql --user=$MARIADB_ROOT << EOF
UPDATE mysql.user SET Password=PASSWORD('$MARIADB_ROOT_PASSWORD') WHERE User='$MARIADB_ROOT';
UPDATE mysql.user SET plugin = '' WHERE User = '$MARIADB_ROOT';
FLUSH PRIVILEGES;

DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='$MARIADB_ROOT' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
FLUSH PRIVILEGES;

CREATE DATABASE IF NOT EXISTS $MARIADB_DB;
CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO '$MARIADB_ROOT'@'%' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON $MARIADB_DB.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD' WITH GRANT OPTION;
FLUSH PRIVILEGES;

ALTER USER '$MARIADB_ROOT'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';
EOF

sleep 10

exec /usr/sbin/mysqld -u $MARIADB_ROOT