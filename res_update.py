#!/usr/bin/env python3
"""
Use from the command line.
Register a reply to a "opinions" or "impression" in the database.

~$ python3 res_update.py [number] [strings]
"""
import sys
from application import db
from application.script.db_handler import DBHandler
from application.model import OpinionsAndImpression


def res_update(no, text):
    """Performing registration with the database"""
    table_name = "opinionsandimpression"
    handler = DBHandler(db, OpinionsAndImpression, table_name)
    handler.opinion_update(no, text)


if __name__ == '__main__':
    if len(sys.argv) != 3:
        print('"Num" and "text" are required as arguments.')
    else:
        res_update(sys.argv[1], sys.argv[2])
