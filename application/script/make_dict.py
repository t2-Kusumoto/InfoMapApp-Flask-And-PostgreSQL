#!/usr/bin/env python3
"""
Responsible for creating "dict" used to embed in ".tpl" files.

"""

import json


def make_display_strings(source_dic):
    product_table = {"mask": "マスク",
                     "wet": "ウエットティッシュ",
                     "soap": "薬用ハンドソープ",
                     "paper": "キッチンペーパー",
                     "liquid": "消毒液類",
                     "noodles": "インスタント麺",
                     "pasta": "パスタ",
                     "sorce": "パスタソース",
                     "flour": "ホットケーキミックス",
                     "snack": "袋入りお菓子"}
    status_table = {
        "full": '<img src="../static/yellow_mini.png"> 少なくなってる',
        "few": '<img src="../static/green_mini.png"> 種類が限られる',
        "finished": '<img src="../static/red_mini.png"> 品切れ',
        "unknown": '<img src="../static/gray_mini.png"> 分からない',
    }
    res_dic = {}
    for key in source_dic:
        res_dic[product_table[key]] = status_table[source_dic[key]]
    return res_dic


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
             "data": make_display_strings(json.loads(r.data)),
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
