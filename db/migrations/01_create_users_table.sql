CREATE TABLE users(
  id SERIAL PRIMARY KEY, 
  first_name VARCHAR(50), 
  last_name VARCHAR(50),
  email VARCHAR(254),
  password VARCHAR(254)
);

CREATE TABLE requests (
  id SERIAL PRIMARY KEY, 
  approved BOOLEAN NOT NULL DEFAULT FALSE, 
  space_id VARCHAR(50), 
  guest_id INT NOT NULL, 
  host_id INT NOT NULL,
);
