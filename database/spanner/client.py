# /// script
# requires-python = ">=3.12"
# dependencies = [
#     "google-cloud-spanner>=3.65.0",
# ]
# ///

from google.cloud import spanner
from google.cloud.spanner_v1.transaction import Transaction

# https://docs.cloud.google.com/python/docs/reference/spanner/latest/google.cloud.spanner_v1.client
experimental_host = "127.0.0.1:15000"
client = spanner.Client(
    experimental_host=experimental_host,
    use_plain_text=True,
)

# https://docs.cloud.google.com/python/docs/reference/spanner/latest/google.cloud.spanner_v1.instance
instance = client.instance("projects/default/instances/default")

# https://docs.cloud.google.com/python/docs/reference/spanner/latest/google.cloud.spanner_v1.database
database = instance.database("retail-sample")


# https://docs.cloud.google.com/python/docs/reference/spanner/latest/google.cloud.spanner_v1.transaction
def query(transaction: Transaction):
    result = transaction.execute_sql(
        "SELECT ProductID, Name, Description, PriceUSD"
        "FROM Products"
        "WHERE SEARCH(Name_Tokens, 'phone')"
        "ORDER BY PriceUSD DESC"
        "LIMIT 10;"
    )

    for row in result.rows:
        print(row)


# TODO: occur error.
database.run_in_transaction(query)
