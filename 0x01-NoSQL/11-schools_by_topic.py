#!/usr/bin/env python3
"""-schools_by_topic"""

from pymongo import MongoClient


def schools_by_topic(mongo_collection, topic):
    """Returns the list of schools having a specific topic
    param: mongo_collection
    param: topic
    return:"""
    return mongo_collection.find({"topics": topic})
