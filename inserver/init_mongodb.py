import pymongo
import os

admin_db = 'admin'

host = os.environ.get('MONGODB_SUGUVOTE_HOST', 'localhost')
port = os.environ.get('MONGODB_SUGUVOTE_PORT', 27017)
db = os.environ.get('MONGODB_SUGUVOTE_DB_NAME', 'suguvote')

admin_username = 'admin'
admin_password = input('Please enter db admin password: ')

username = os.environ.get('MONGODB_SUGUVOTE_USERNAME', 'suguvote')
password = os.environ.get('MONGODB_SUGUVOTE_PASSWORD', input('Please enter db normal user password: '))

client = pymongo.MongoClient(host, port)

client[admin_db].command(
  "createUser",
  admin_username,
  pwd=admin_password,
  roles=[
    {
      'role': 'userAdminAnyDatabase',
      'db': admin_db,
    },
    "readWriteAnyDatabase"
  ],
)

client[db].command(
  "createUser",
  username,
  pwd=password,
  roles=[
    {
      'role': 'readWrite',
      'db': db,
    },
  ],
)