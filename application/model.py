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
    .format(self.code, self.shopname, self.address,
            self.tel, self.opentime, self.lastupdate,
            self.lat, self.lng)


class PostData(db.Model):
    __tablename__ = 'postdata'
    no = db.Column(db.Integer, primary_key=True)
    code = db.Column(db.String(4))
    date = db.Column(db.String(32))
    data = db.Column(db.Text)
    text = db.Column(db.Text)
    token = db.Column(db.Text)

    def __repr__(self):
        return "<ShopsInfo(code='%s', date='%s', data='%s',\
            text='%s', token='%s')>"\
    .format(self.code, self.date, self.data,
            self.text, self.token)


class OpinionsAndImpression(db.Model):
    __tablename__ = 'opinions'
    no = db.Column(db.Integer, primary_key=True)
    opinion = db.Column(db.Text)
    response = db.Column(db.Text)
    token = db.Column(db.Text)

    def __repr__(self):
        return "<OpinionsAndImpression(opinion='%s',\
            response='%s', token='%s')>"\
    .format(self.opinion, self.response, self.token)


class PostHash(db.Model):
    __tablename__ = 'posthash'
    no = db.Column(db.Integer, primary_key=True)
    post_number = db.Column(db.Integer)
    key = db.Column(db.Text)

    def __repr__(self):
        return "<PostHash(post_number='%s',key='%s')>"\
            .format(self.category, self.post_num, self.key)


class OpinionHash(db.Model):
    __tablename__ = 'opinionhash'
    no = db.Column(db.Integer, primary_key=True)
    post_number = db.Column(db.Integer)
    key = db.Column(db.Text)

    def __repr__(self):
        return "<OpinionHash(post_number='%s',key='%s')>"\
            .format(self.category, self.post_num, self.key)


def create_db():
    db.create_all()
