#!/usr/bin/env python3
# -*- coding: utf-8 -*-

## azure database connect
# host = "t2-webapp-db.postgres.database.azure.com"
# dbname = "sky"
# port = "5432"
# user = "t2kusumoto@t2-webapp-db"
# password = "oto_kare_eiel"

# SQLALCHEMY_DATABASE_URI = 'postgresql://{}:{}@{}:{}/{}'.format(user, password, host, port, dbname)
DEBUG = True

# Use local db
SQLALCHEMY_DATABASE_URI = 'postgresql://t2kusumoto:otokareeiel@localhost:5432/mapsapp'

SQLALCHEMY_TRACK_MODIFICATIONS = True

SECRET_KEY = 'dev'
