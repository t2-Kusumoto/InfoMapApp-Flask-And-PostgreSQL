#!/usr/bin/env python3

import hashlib
import random


def generate_passwd(length):
    """Generate code to use when deleting"""
    char = "abcdefghijklmnopqrstuvwxyz0123456789"
    passwd = ""
    for _ in range(length):
        passwd += char[random.randint(0, len(char)-1)]
    return passwd


def generate_sha256(passwd):
    return hashlib.sha256(passwd.encode()).hexdigest()


def create_postnum_and_passwd(handler, token):
    password = generate_passwd(6)
    _hash = generate_sha256(password)
    post_num = handler.select_num(token)
    return password, _hash, post_num


def collate_hash(time, handler):
    token = generate_sha256(time)
    res = handler.collate_hash(token)
    return res, token
