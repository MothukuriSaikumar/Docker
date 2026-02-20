#!/bin/bash
# This is a custom script that will be executed when the MySQL container starts.
if [ -f /tmp/mysql-root-password.txt ]; then
    PASSWORD=$(cat /tmp/mysql-root-password.txt)
    echo  Accessed MySQL root password
else
    echo " MySQL root password not found "
    exit 1



fi
export MYSQL_ROOT_PASSWORD=$PASSWORD
rm -rf /tmp/mysql-root-password.txt
exec /entrypoint.sh mysqld
