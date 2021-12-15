CREATE TABLE users (
  id serial PRIMARY KEY,
  name VARCHAR ( 50 ) NOT NULL,
  email VARCHAR ( 100 ) NOT NULL,
  password VARCHAR ( 50 ) UNIQUE NOT NULL
);

CREATE TABLE spaces (
  id serial PRIMARY KEY,
  location VARCHAR ( 100 ) NOT NULL,
  price NUMERIC ( 5,2 ) NOT NULL,
  host_id VARCHAR( 50 ) UNIQUE NOT NULL,
  guest_id VARCHAR( 50 ) UNIQUE NOT NULL,
  booked BOOLEAN SET DEFAULT FALSE
);


INSERT INTO users(name, email, password)
VALUES ('Team-sp', 'teamsp@hotmail.com', 'makers');

INSERT INTO spaces(location, price, host_id, guest_id, booked)
VALUES ('Shoreditch', '500', 'host_1', '1',);

ALTER TABLE spaces
ALTER booked
SET DEFAULT FALSE;