#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import html
import sys

from application import db
from application.model import create_db
from application.model import ShopsInfo
from instance import insert_data


def insert(dic):
    data = ShopsInfo(code=html.escape(dic['code']),
                     shopname=html.escape(dic['shopname']),
                     lastupdate=html.escape(dic['lastupdate']),
                     opentime=html.escape(dic['open']),
                     address=html.escape(dic['address']),
                     lat=dic['lat'],
                     lng=dic['lng'],
                     tel=html.escape(dic['tel']))
    db.session.add(data)
    db.session.commit()


def setup_db():
    data = insert_data.DATA
    print('insert start')
    for d in data:
        insert(d)
    print('end')


if __name__ == '__main__':
    if sys.argv[1] == 'create':
        create_db()
    elif sys.argv[1] == 'insert':
        setup_db()
