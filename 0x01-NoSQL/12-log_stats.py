#!/usr/bin/env python3
"""Log stats"""
from pymongo import MongoClient


def log_stats(mongo_collection, option=None):
    """script that provides some stats
    about Nginx logs stored in MongoDB
    """
    METHODS = ["GET", "POST", "PUT", "PATCH", "DELETE"]
    items = {}
    if option:
        vl = mongo_collection.count_documents(
            {"method": {"$regex": option}})
        print(f"\tmethod {option}: {vl}")
        return

    rslt = mongo_collection.count_documents(items)
    print(f"{rslt} logs")
    print("Methods:")
    for method in METHODS:
        log_stats(nginx_collection, method)
    status_check = mongo_collection.count_documents({"path": "/status"})
    print(f"{status_check} status check")


if __name__ == "__main__":
    nginx_collection = MongoClient('mongodb://127.0.0.1:27017').logs.nginx
    log_stats(nginx_collection)
