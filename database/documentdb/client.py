# /// script
# requires-python = ">=3.12"
# dependencies = [
#     "pymongo",
# ]
# ///

from pymongo import MongoClient

uri = "mongodb://admin:admin@127.0.0.1:10260/?tls=true&tlsAllowInvalidCertificates=true"
client = MongoClient(uri)

# Create database and collection
test_database = client["test"]
test_collection = test_database.create_collection("test")

# Insert data
test_collection.insert_one(
    {
        "id": "aaa",
        "name": "AAA",
    }
)

# Fetch data
for document in test_collection.find():
    print(document)

# Delete database
client.drop_database(test_database)
