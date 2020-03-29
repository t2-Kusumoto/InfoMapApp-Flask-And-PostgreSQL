#!/usr/bin/env python3

from application import db


class ShopsInfo(db.Model):
    __tablename__ = 'shopsinfo'
    code = db.Column(db.String(4), primary_key=True)
    shopname = db.Column(db.String(24))
    address = db.Column(db.String(36))
    tel = db.Column(db.String(16))
    opentime = db.Column(db.String(36))
    lastupdate = db.Column(db.String(16))
    lat = db.Column(db.Float)
    lng = db.Column(db.Float)

    def __repr__(self):
        return "<ShopsInfo(code='%s', shopname='%s', address='%s',\
        tel='%s', lastupdate='%s', lat='%s', lng='%s')>"\
    .format(self.code, self.shopname, self.address, self.tel,
            self.opentime, self.lastupdate, self.lat, self.lng)


class PostData(db.Model):
    __tablename__ = 'postdata'
    code = db.Column(db.String(4), primary_key=True)
    date = db.Column(db.String(16))
    mask = db.Column(db.String(8))
    paper = db.Column(db.String(8))
    liquied = db.Column(db.String(8))
    sheet = db.Column(db.String(8))
    text = db.Column(db.String(256))

    def __repr__(self):
        return "<ShopsInfo(code='%s', date='%s', mask='%s',\
        paper='%s', liquied='%s', sheet='%s', text='%s')>"\
    .format(self.code, self.date, self.mask, self.paper,
            self.liquied, self.sheet, self.text)

def create_db():
    db.create_all()
