#!/usr/bin/env python3


def make_info_dict(res):
    info_list = []
    for r in res:
        text = "<br>".join(r.text.split()) if "\n" in r.text else r.text
        info_list.append(
            {"code": r.code,
             "date": r.date,
             "mask": r.mask,
             "paper": r.paper,
             "liquied": r.liquied,
             "sheet": r.sheet,
             "text": text,
             })
    return info_list
