#!/usr/bin/env python3
"""
Class responsible for handling the database

"""

import datetime
import html
from sqlalchemy import and_


class DBHandler:
    """Database handling Class"""

    def __init__(self, db, table, name):
        self.db = db
        self.table = table
        self.name = name
        self.now = datetime.datetime.now().strftime(
            '%Y年%m月%d日 %H:%M')

    def insert(self, contents):
        if self.name == "shopinfo":
            data = self.table(code=html.escape(contents['code']),
                              shopname=html.escape(contents['shopname']),
                              opentime=html.escape(contents['open']),
                              address=html.escape(contents['address']),
                              lastupdate=html.escape(contents['update']),
                              lat=contents['lat'],
                              lng=contents['lng'],
                              tel=html.escape(contents['tel']))
        elif self.name == "postdata":
            data = self.table(code=html.escape(contents['code']),
                              date=html.escape(self.now),
                              mask=html.escape(contents['mask']),
                              wet=html.escape(contents['wet']),
                              soap=html.escape(contents['soap']),
                              water=html.escape(contents['water']),
                              rice=html.escape(contents['rice']),
                              noodles=html.escape(contents['noodles']),
                              pasta=html.escape(contents['pasta']),
                              text=html.escape(contents['text']),
                              token=contents['token'])
        elif self.name == "opinionsandimpression":
            data = self.table(opinion=html.escape(contents['opinion']),
                              response="",
                              token=contents['token'])
        else:
            data = self.table(post_number=contents['post_number'],
                              key=contents['key'])
        self.db.session.add(data)
        self.db.session.commit()
        self.db.session.close()

    def update(self, code):
        """update query"""
        now = self.now
        update_row = self.db.session.query(self.table).\
            filter_by(code=code).first()
        update_row.lastupdate = now
        self.db.session.commit()
        self.db.session.close()
        return now

    def opinion_update(self, no, text):
        res_set_record = self.db.session.query(self.table).\
            filter_by(no=no).first()
        res_set_record.response = text
        self.db.session.commit()
        self.db.session.close()

    def select_all(self):
        if self.name == "opinionsandimpression":
            return self.table.query.order_by(self.table.no.desc())
        else:
            return self.table.query.all()

    def select(self, code):
        res = self.table.query.filter(self.table.code == code)\
            .order_by(self.table.no.desc())
        return res

    def select_num(self, token):
        res = self.table.query.filter(self.table.token == token).first()
        return res.no

    def collate(self, contents):
        res = self.table.query.filter(
            and_(self.table.no == contents["no"],
                 self.table.key == contents["key"])).first()
        if res:
            return res.no
        else:
            return None

    def collate_hash(self, token):
        res = self.table.query.filter(self.table.token == token).first()
        return res

    def delete(self, no):
        delete_row = self.db.session.query(self.table).\
            filter_by(no=no).first()
        self.db.session.delete(delete_row)
        self.db.session.commit()
        self.db.session.close()
