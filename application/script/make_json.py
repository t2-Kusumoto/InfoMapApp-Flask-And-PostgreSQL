#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from application import db
from application.script.db_handler import DBHandler
from application.model import ShopsInfo

def create_map_data(res):
    """下記create_js_file() と合わせてdata.js を作成"""
    json_obj = '{'
    data = """
    "{0}" : {{"shopname": "{1}",
              "lastupdate": "{2}",
              "opentime": "{3}",
              "address": "{4}",
              "latlng": {{"lat":{5}, "lng": {6}}},
              "tel": "{7}"
              }},
    """
    for r in res:
        parts = data.format(r.code,
                            r.shopname,
                            r.lastupdate,
                            r.opentime,
                            r.address,
                            r.lat,
                            r.lng,
                            r.tel,
                            )

        json_obj += parts
    json_obj = json_obj.strip()[:-1]
    json_obj += "}"

    create_json_file(json_obj)


def create_json_file(contents):
    """ js/ 内に作成。環境によってpathを替えること"""
    with open("application/static/data.json", "wt", encoding="utf-8") as f:
        f.write(contents)


def make_json_file():
    handler = DBHandler(db, ShopsInfo, "shopinfo")
    res = handler.select_all()
    create_map_data(res)
