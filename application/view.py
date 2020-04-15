#!/usr/bin/env python3

import os
from application import app
from application import db
from application.model import ShopsInfo
from application.model import PostData
from application.model import OpinionsAndImpression
from application.model import PostHash
from application.model import OpinionHash
from application.script.db_handler import DBHandler
from application.script import make_dict
from application.script import make_json
from application.script import script
from flask import render_template
from flask import request
from flask import send_from_directory


@app.route('/', methods=["GET"])
def main_map():
    return render_template('index.html')


@app.route('/form', methods=["POST"])
def form():
    time = request.form['time']
    name = request.form['shopname']
    code = request.form['shopcode']
    return render_template('form.tpl',
                           shopname=name,
                           shopcode=code,
                           time=time)


@app.route('/view', methods=["POST"])
def view():
    code = request.form['shopcode']
    name = request.form['shopname']
    select_handler = DBHandler(db, PostData, "postdata")
    res = select_handler.select(code)
    infos = make_dict.make_info_dict(res)

    return render_template('view.tpl',
                           infomation=infos,
                           shopname=name,
                           shopcode=code)


@app.route('/insert_info', methods=["POST"])
def insert_info():
    time = request.form['time']
    post_handler = DBHandler(db, PostData, "postdata")
    res, token = script.collate_hash(time, post_handler)
    if res:
        return render_template('avoidance.tpl')

    code = request.form['shopcode']
    name = request.form['shopname']
    contents = {"code": code,
                "mask": request.form["mask"],
                "wet": request.form["wet"],
                "soap": request.form["soap"],
                "water": request.form["water"],
                "rice": request.form["rice"],
                "noodles": request.form["noodles"],
                "pasta": request.form["pasta"],
                "text": request.form["text"],
                "token": token
                }
    update_handler = DBHandler(db, ShopsInfo, "shopinfo")
    hash_handler = DBHandler(db, PostHash, 'hash')
    update_handler.update(code)
    make_json.make_json_file()
    post_handler.insert(contents)
    password, key, post_num =\
        script.create_postnum_and_passwd(post_handler, token)
    hash_handler.insert({"post_number": post_num,
                         "key": key})
    return render_template('thanks.tpl',
                           shopcode=code,
                           shopname=name,
                           passwd=password,
                           post_num=post_num)


@app.route('/opinions_and_impression', methods=['POST'])
def opinions_and_impression():
    time = request.form['time']
    handler = DBHandler(db,
                        OpinionsAndImpression,
                        'opinionsandimpression')
    res = handler.select_all()
    opinions = make_dict.make_opinions_dict(res)
    return render_template('opinions.tpl',
                           opinions=opinions,
                           time=time)


@app.route('/opinions_insert', methods=["POST"])
def opinions_insert():
    time = request.form['time']
    opinion_handler = DBHandler(
    db, OpinionsAndImpression, 'opinionsandimpression')
    res, token = script.collate_hash(time, opinion_handler)
    if res:
        return render_template('avoidance.tpl')

    contents = {"opinion": request.form["opinion"],
                "token": token}
    opinion_handler.insert(contents)
    password, key, post_num =\
        script.create_postnum_and_passwd(opinion_handler, token)
    hash_handler = DBHandler(db, OpinionHash, 'hash')
    hash_handler.insert({"post_number": post_num,
                         "key": key})
    return render_template('receive.tpl',
                           post_num=post_num,
                           passwd=password)


@app.route('/post_delete')
def post_delete():
    return render_template('delete.tpl', category="post")


@app.route('/opinion_delete')
def opinion_delete():
    return render_template('delete.tpl', category="opinion")


@app.route('/delete_row', methods=['POST'])
def delete_row():
    if request.form['category'] == 'post':
        content_handler = DBHandler(db, PostData, 'postdata')
        hash_handler = DBHandler(db, PostHash, 'hash')
    else:
        content_handler = DBHandler(db, OpinionsAndImpression, 'postdata')
        hash_handler = DBHandler(db, OpinionHash, 'hash')
    key = script.generate_sha256(request.form['passwd'])
    result = hash_handler.collate({"no": int(request.form["number"]),
                                   "key": key})
    if result:
        content_handler.delete(result)
        hash_handler.delete(result)
        return render_template('delete_ok.tpl')
    else:
        return render_template('not_delete.tpl')


@app.route('/favicon.ico')
def display_favicon():
    return send_from_directory(os.path.join(app.root_path, 'static'),
                               'favicon.ico',
                               mimetype='image/vnd.microsoft.icon')
