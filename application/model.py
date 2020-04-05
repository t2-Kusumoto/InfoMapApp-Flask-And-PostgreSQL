#!/usr/bin/env python3

from application import db


class ShopsInfo(db.Model):
    __tablename__ = 'shopsinfo'
    no = db.Column(db.Integer, primary_key=True)
    code = db.Column(db.String(4))
    shopname = db.Column(db.String(64))
    address = db.Column(db.String(128))
    tel = db.Column(db.String(16))
    opentime = db.Column(db.String(64))
    lastupdate = db.Column(db.String(32))
    lat = db.Column(db.Float)
    lng = db.Column(db.Float)

    def __repr__(self):
        return "<ShopsInfo(code='%s', shopname='%s', address='%s',\
        tel='%s', lastupdate='%s', lat='%s', lng='%s')>"\
    .format(self.code, self.shopname, self.address, self.tel,
            self.opentime, self.lastupdate, self.lat, self.lng)


class PostData(db.Model):
    __tablename__ = 'postdata'
    no = db.Column(db.Integer, primary_key=True)
    code = db.Column(db.String(4))
    date = db.Column(db.String(32))
    mask = db.Column(db.String(8))
    wet = db.Column(db.String(8))
    paper = db.Column(db.String(8))
    water = db.Column(db.String(8))
    text = db.Column(db.Text)

    def __repr__(self):
        return "<ShopsInfo(code='%s', date='%s', mask='%s',\
        wet='%s', paper='%s', water='%s', text='%s')>"\
    .format(self.code, self.date, self.mask, self.wet, self.paper,
    self.water, self.text)


class OpinionsAndImpression(db.Model):
    __tablename__ = 'opinions'
    no = db.Column(db.Integer, primary_key=True)
    date = db.Column(db.String(32))
    opinion = db.Column(db.Text)
    response = db.Column(db.Text)

    def __repr__(self):
        return "<OpinionsAndImpression(date='%s',opinion='%s',\
            response='%s')>"\
    .format(self.date, self.opinion, self.response)


def create_db():
    db.create_all()
