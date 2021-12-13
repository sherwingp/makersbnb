Makersbnb
=================

An Airbnb Clone built in Ruby using Sinatra, Capybara, and PostgreSQL.

## Setup

```
bundle
 ```

 ### To set up the database

 Connect to `psql` and create the `makersbnb` database:

 ```
 CREATE DATABASE chitter;
 ```

 To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

 ### To run the Makersbnb app:

 ```
 rackup -p 3000
 ```

 To get started, navigate to `localhost:3000/`

### Test setup

Follow the database setup instructions, but with the `makersbnb_test` database.

To run tests:

```
rspec
```
