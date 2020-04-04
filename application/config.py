#!/usr/bin/env python3
# -*- coding: utf-8 -*-

## azure database connect
host = "t2-webapp-db.postgres.database.azure.com"
dbname = "mapsapp"
port = "5432"
user = "t2kusumoto@t2-webapp-db"
password = "oto_kare_eiel"

SQLALCHEMY_DATABASE_URI = 'postgresql://{}:{}@{}:{}/{}'.format(user, password, host, port, dbname)
DEBUG = False

# Use local db
# SQLALCHEMY_DATABASE_URI = 'postgresql://t2kusumoto:otokareeiel@localhost:5432/mapsapp'
#DEBUG = True


SQLALCHEMY_TRACK_MODIFICATIONS = True

SECRET_KEY = b'g` \x83\xef]\xeaKl\x105-D\x96\x85A'
