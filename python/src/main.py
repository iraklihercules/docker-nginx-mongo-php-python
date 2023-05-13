import os
import datetime
from pymongo import MongoClient

MONGO_DATABASE = os.getenv("MONGO_DATABASE")
MONGO_USERNAME = os.getenv("MONGO_USERNAME")
MONGO_PASSWORD = os.getenv("MONGO_PASSWORD")

if __name__ == "__main__":

    client = MongoClient("mongodb://mongo:27017/", username=MONGO_USERNAME, password=MONGO_PASSWORD)

    database = client[MONGO_DATABASE]
    collection = database['User']

    user = collection.find_one()
    if not user:
        collection.insert_one({
            "username": "John Doe",
            "email": "john.doe@example.com",
            "createdAt": datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        })
        user = collection.find_one()

    print(user)
