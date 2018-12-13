    # Proto.io
## This is a small web application of the sort which is perfect for Flask. Its purpose is to manage a queue of samples meant for genomic sequencing and testing, and the storage of results.
## It uses a MySQL database and has file upload capability. It is meant for **Python 3.x**.

### To get up and running:

1. Install Python 3.x and MySQL and virtualenv
2. Load the included virtualenv or install Flask and MySQLdb
3. Ensure that MySQL is up and running and make a note of the user and password.
3. Run protoio.sql against the MySQL database. (Open the MySQL console and run `source protoio.sql`)
4. Fill in the user credentials of the MySQL db in protoio.py
5. Generate a random string with the appropriate amount of entropy to use as a secret key and fill it in between the quotes on line 80

## Screenshots

![Proto.io Screenshot 1](Screenshot from 2018-01-07 09-52-00.png?raw=true "Screenshot 1")

![Proto.io Screenshot 2](Screenshot from 2018-01-07 09-52-44.png?raw=true "Screenshot 2")

![Proto.io Screenshot 3](Screenshot from 2018-01-07 09-52-00.png?raw=true "Screenshot 3")
