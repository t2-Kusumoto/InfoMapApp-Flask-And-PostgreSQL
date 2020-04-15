#!/usr/bin/env python3
"""
Responsible for creating "dict" used to embed in ".tpl" files.

"""


def make_stock_status(color):
    """Creating an HTML string corresponding to the 'color'
    'color' represents the stock status."""
    if color == "green":
        return '&emsp;<img src="../static/green_mini.png">&emsp;あり'
    elif color == "yellow":
        return '&emsp;<img src="../static/yellow_mini.png">&emsp;少ない'
    elif color == "red":
        return '&emsp;<img src="../static/red_mini.png">&emsp;なし'
    else:
        return '&emsp;<img src="../static/gray_mini.png">&emsp;分からない'


def make_text(txt):
    """Replace line feed code with HTML format"""
    return "<br>".join(txt.split("\n")) if "\n" in txt else txt


def make_info_dict(res):
    """creating "dict" used to embed in "view.tpl" files"""
    info_list = []
    for r in res:
        info_list.append(
            {"no": r.no,
             "code": r.code,
             "date": r.date,
             "mask": make_stock_status(r.mask),
             "wet": make_stock_status(r.wet),
             "soap": make_stock_status(r.soap),
             "water": make_stock_status(r.water),
             "rice": make_stock_status(r.rice),
             "noodles": make_stock_status(r.noodles),
             "pasta": make_stock_status(r.pasta),
             "text": make_text(r.text),
             "token": r.token
             })
    return info_list


def make_opinions_dict(res):
    """creating "dict" used to embed in "opinions.tpl" files"""
    opinions_list = []
    for r in res:
        opinions_list.append(
            {"no": r.no,
             "opinion": make_text(r.opinion),
             "response": make_text(r.response),
             "token": r.token
             })
    return opinions_list
