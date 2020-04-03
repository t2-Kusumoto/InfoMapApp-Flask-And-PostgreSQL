#!/usr/bin/env python3

def make_stock_status(color):
    if color == "green":
        return '&emsp;<img src="../static/green_mini.png">&emsp;あり'
    elif color == "yellow":
        return '&emsp;<img src="../static/yellow_mini.png">&emsp;残りわずか'
    elif color == "red":
        return '&emsp;<img src="../static/red_mini.png">&emsp;なし'
    else:
        return '&emsp;<img src="../static/gray_mini.png">&emsp;分からない'


def make_text(txt):
    return "<br>".join(txt.split("\n")) if "\n" in txt else txt

def make_info_dict(res):
    info_list = []
    for r in res:
        info_list.append(
            {"code": r.code,
             "date": r.date,
             "mask": make_stock_status(r.mask),
             "paper": make_stock_status(r.paper),
             "liquied": make_stock_status(r.liquied),
             "sheet": make_stock_status(r.sheet),
             "text": make_text(r.text),
             })
    return info_list
