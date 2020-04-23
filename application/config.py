#!/usr/bin/env python3
# -*- coding: utf-8 -*-


host = "<host name>"
dbname = "<database name>"
port = "5432"
user = "<user name>"
password = "<password>"

SQLALCHEMY_DATABASE_URI = 'postgresql://{}:{}@{}:{}/{}'.format(user,
                                                               password,
                                                               host,
                                                               port,
                                                               dbname)

SQLALCHEMY_TRACK_MODIFICATIONS = True
SECRET_KEY = <secret key>
