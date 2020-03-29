#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import html
import sys

from application import db
from application.model import create_db
from application.model import ShopsInfo
from application.model import PostData
from application.script import make_json
from application.script.db_handler import DBHandler
from instance import insert_data


def insert_shops_data():
    handler = DBHandler(db, ShopsInfo, "shopinfo")
    data = insert_data.DATA
    print('insert start')
    for d in data:
        handler.insert(d)
    print('end')

def make_init_json():
    print('create application/static/data.json')
    make_json.make_json_file()
    print("END (data length : {})".format(len(res)))

if __name__ == '__main__':
    if sys.argv[1] == 'create':
        create_db()
    elif sys.argv[1] == 'insert':
        insert_shops_data()
    elif sys.argv[1] == 'makejson':
        make_init_json()
