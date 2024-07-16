#!/usr/bin/env python3
"""101-students.py"""
from pymongo import MongoClient


def top_students(mongo_collection):
    """Returns all students sorted by average score
    param:mongo_collection
    param: averageScore"""
    pipeline = [
        {
            '$project': {
                'name': 1,
                'averageScore': { '$avg': '$topics.score' }
            }
        },
        {
            '$sort': { 'averageScore': -1 }
        }
    ]
    return list(mongo_collection.aggregate(pipeline))


if __name__ == "__main__":
    client = MongoClient('mongodb://127.0.0.1:27017')
    students_collection = client.my_db.students

    top_students_list = top_students(students_collection)
    for student in top_students_list:
        print(f"[{student.get('_id')}] {student.get('name')} => {student.get('averageScore')}")

