#!/usr/bin/env python3

import os
from application import app
from application import db
from application.model import ShopsInfo
from application.model import PostData
from application.model import OpinionsAndImpression
from application.script.db_handler import DBHandler
from application.script.make_dict import make_info_dict
from application.script.make_dict import make_opinions_dict
from application.script.make_json import make_json_file
from flask import render_template, request
from flask import send_from_directory


@app.route('/', methods=["GET"])
def main_map():
    return render_template('index.html')


@app.route('/form', methods=["POST"])
def form():
    name = request.form['shopname']
    code = request.form['shopcode']
    return render_template('form.tpl', shopname=name, shopcode=code)


@app.route('/view', methods=["POST"])
def view():
    code = request.form['shopcode']
    name = request.form['shopname']
    select_handler = DBHandler(db, PostData, "postdata")
    res = select_handler.select(code)
    infos = make_info_dict(res)

    return render_template('view.tpl',
                           infomation=infos,
                           shopname=name,
                           shopcode=code)


@app.route('/insert_info', methods=['POST'])
def insert_info():
    code = request.form['shopcode']
    name = request.form['shopname']
    contents = {"code": code,
                "mask": request.form["mask"],
                "wet": request.form["wet"],
                "paper": request.form["paper"],
                "water": request.form["water"],
                "text": request.form["text"]
                }
    handler = DBHandler(db, PostData, "postdata")
    update_handler = DBHandler(db, ShopsInfo, "shopinfo")
    update_handler.update(code)
    make_json_file()
    handler.insert(contents)
    return render_template('thanks.tpl', shopcode=code, shopname=name)


@app.route('/opinions_and_impression')
def opinions_and_impression():
    handler = DBHandler(db,
                        OpinionsAndImpression,
                        'opinionsandimpression')
    res = handler.select_all()
    opinions = make_opinions_dict(res)
    return render_template('opinions.tpl', opinions=opinions)


@app.route('/opinions_insert', methods=["POST"])
def opinions_insert():
    opinion = request.form["opinion"]
    handler = DBHandler(db, OpinionsAndImpression, 'opinionsandimpression')
    handler.insert(opinion)
    return render_template('receive.tpl')


@app.route('/favicon.ico')
def display_favicon():
    return send_from_directory(os.path.join(app.root_path, 'static'),
                               'favicon.ico',
                               mimetype='image/vnd.microsoft.icon')
