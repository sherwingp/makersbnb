CREATE TABLE requests (
  id SERIAL PRIMARY KEY, 
  approved BOOLEAN NOT NULL DEFAULT FALSE, 
  space_id INT NOT NULL REFERENCES spaces(id), 
  guest_id INT NOT NULL REFERENCES users(id), 
  host_id INT NOT NULL REFERENCES users(id)
);
