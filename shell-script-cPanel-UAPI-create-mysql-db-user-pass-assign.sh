#!/bin/bash

### Shell script to create database, database user & password, assign the databse user to database with "ALL PRIVILEGES" by using cPanel's UAPI

### Arguments
### - $1 > cPanel-UserName
### - $2 > DATABASE-NAME
### - $3 > DATABASE-USERNAME
### - $4 > DATABASE-USER-PASSWORD (18 characters, use https://passwordsgenerator.net/)
### - $5 > PRIVILEGES ( e.g ALL%20PRIVILEGES )

if [[ $# -eq 0 ]]; then
	echo '### You must pass at least 4 arguments'
	exit 1
else
	uapi --user=$1 Mysql create_database name=$1_$2
	uapi --user=$1 Mysql create_user name=$1_$3 password=$4
	uapi --user=$1 Mysql set_privileges_on_database user=$1_$3 database=$1_$2 privileges=$5
fi
