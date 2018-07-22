DROP TABLE patients IF exists;
DROP TABLE diseases IF exists;
DROP TABLE diagnoses IF exists;

CREATE TABLE patients
(
  id serial8 primary key,
  first_name VARCHAR(255) not null,
  second_name VARCHAR(255) not null,
  dob VARCHAR(10), -- restrain to xx-xx-xxxx
  age INT2,
  gender VARCHAR(255),
  profession VARCHAR(255)
);

CREATE TABLE diseases
(
  id serial8 primary key,
  common_name VARCHAR(255) not null,
  latin_name VARCHAR(255),
  disease_agent_class VARCHAR(255),
  organs_affected VARCHAR(255),
  severity_index INT2
);

CREATE TABLE diagnoses
(
  id serial8 primary key,
  disease_id INT8 references diseases(id),
  patient_id INT8 references patients(id),
  date_of_diagnosis VARCHAR(10), -- restrain to xx-xx-xxxx
  severity_score INT2,
  disease_active VARCHAR(5), -- restrict to true or false
  date_of_resolution VARCHAR(10) -- restrain to xx-xx-xxxx
);
