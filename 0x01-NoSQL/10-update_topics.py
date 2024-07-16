#!/usr/bin/env python3
"""change school topics"""


def update_topics(mongo_collection, name, topics):
    """Updates all topics of a school document based on the name
    param: mongo collection,
    param: name
    param: topics
    return:"""
    mongo_collection.update_many(
        {"name": name},
        {"$set": {"topics": topics}}
    )
