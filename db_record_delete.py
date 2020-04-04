#!/usr/bin/env python3
"""
delete row

## usage
~$ python3 db_record_delete.py <number> <tablename:[post or opinion]>

"""
import sys
from application import db
from application.script.db_handler import DBHandler
from application.model import OpinionsAndImpression
from application.model import PostData


def delete_row(no, table_name):
    if table_name == 'post':
        table = PostData
        name = "postdata"
    elif table_name == 'opinion':
        table = OpinionsAndImpression
        name = "opinionsandimpression"
    else:
        print('wrong table_name...')
        return
    handler = DBHandler(db, table, name)
    handler.delete(no)


if __name__ == '__main__':
    if len(sys.argv) != 3:
        print('"Num" and "text" are required as arguments.')
    else:
        print("no = {}, table = {}".format(sys.argv[1], sys.argv[2]))
        really = input("run? yes/no --> ")
        if really == "yes":
            delete_row(sys.argv[1], sys.argv[2])
        else:
            print("pass")
