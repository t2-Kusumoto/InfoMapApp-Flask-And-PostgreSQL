#!/usr/bin/env python3

from application import app
# from application.script.handler import DBHandler
# from application.script.make_json import create_map_data
from flask import render_template, request


@app.route('/', methods=["GET"])
def main_map():
    return render_template('index.html')


@app.route('/form', methods=["POST"])
def form():
    res = request.form['shopcode']
    return render_template('form.tpl', shopcode=res)


@app.route('/view', methods=["POST"])
def view():
    return render_template('view.tpl')
