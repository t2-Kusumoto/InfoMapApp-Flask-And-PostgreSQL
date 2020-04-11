#!/usr/bin/env python3
# -*- coding: utf-8 -*-



# host = "<host name>"
# dbname = "<database name>"
# port = "5432"
# user = "<user name>"
# password = "<password>"
#
# SQLALCHEMY_DATABASE_URI = 'postgresql://{}:{}@{}:{}/{}'.format(user,
#                                                                password,
#                                                                host,
#                                                                port,
#                                                                dbname)

# SECRET_KEY = <seacret key>

#Use local db
SQLALCHEMY_DATABASE_URI = 'postgresql://t2kusumoto:otokareeiel@localhost:5432/mapsapp'
DEBUG = True


SQLALCHEMY_TRACK_MODIFICATIONS = True

SECRET_KEY = b'g` \x83\xef]\xeaKl\x105-D\x96\x85A'
