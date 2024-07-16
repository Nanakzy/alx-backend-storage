//lists all documents in a collection


def list_all(mongo_collection):
    """
    List all documents in a collection.

    :param mongo_collection: pymongo collection object
    :return: list of all documents in the collection
    """
    return list(mongo_collection.find())
