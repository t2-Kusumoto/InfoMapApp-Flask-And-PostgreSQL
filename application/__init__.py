#!/usr/bin/env python3

import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__, instance_relative_config=True)
app.config.from_object('application.config')

db = SQLAlchemy(app)

try:
    os.makedirs(app.instance_path)
except OSError:
    pass


from application import view
