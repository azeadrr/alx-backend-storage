#!/usr/bin/env python3
"""List all documents in Python"""


def list_all(mongo_collection):
    """function lists all docs in a collection"""
    return list(mongo_collection.find())
