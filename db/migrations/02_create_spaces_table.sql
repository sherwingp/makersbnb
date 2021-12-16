CREATE TABLE spaces (
  id serial PRIMARY KEY,
  location VARCHAR ( 100 ),
  description VARCHAR ( 254 ),
  price BIGINT,
  available_from DATE,
  available_to DATE,
  booked BOOLEAN DEFAULT FALSE,
  host_id INT REFERENCES users(id),
  guest_id INT REFERENCES users(id)
);
