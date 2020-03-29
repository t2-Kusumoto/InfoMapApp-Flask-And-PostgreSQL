#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import datetime
import html

class DBHandler:

    def __init__(self, db, table, name):
        self.db = db
        self.table = table
        self.name = name
        self.now = datetime.datetime.now().strftime(
            '%Y年%m月%d日 %H:%M')

    def insert(self, dic):
        if self.name == "shopinfo":
            data = self.table(code=html.escape(dic['code']),
                             shopname=html.escape(dic['shopname']),
                             opentime=html.escape(dic['open']),
                             address=html.escape(dic['address']),
                             lastupdate=html.escape(dic['update']),
                             lat=dic['lat'],
                             lng=dic['lng'],
                             tel=html.escape(dic['tel']))
        else:
            data = self.table(code=html.escape(dic['code']),
                             date=html.escape(self.now),
                             mask=html.escape(dic['mask']),
                             paper=html.escape(dic['paper']),
                             liquied=html.escape(dic['liquied']),
                             sheet=html.escape(dic['sheet']),
                             text=html.escape(dic['text']))
        self.db.session.add(data)
        self.db.session.commit()
        self.db.session.close()

    def update(self, code):
        """update query"""
        update_row = self.db.session.query(self.table).\
            filter_by(code=code).first()
        update_row.lastupdate = self.now
        self.db.session.commit()
        self.db.session.close()

    def select_all(self):
        return self.table.query.all()

    def select(self, code):
        query = self.table.query.filter(self.table.code == code).order_by(self.table.date.desc())
        return query
