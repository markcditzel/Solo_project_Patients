DROP TABLE diagnoses if EXISTS;
DROP TABLE patients if EXISTS;
DROP TABLE diseases if EXISTS;

CREATE TABLE patients (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR (255),
  second_name VARCHAR(255),
  dob VARCHAR(10),
  age INT2,
  gender VARCHAR(255),
  profession VARCHAR(255)
);

CREATE TABLE diseases
(
  id SERIAL8 PRIMARY KEY,
  common_name VARCHAR(255),
  latin_name VARCHAR(255),
  disease_agent_class VARCHAR(255),
  organs_affected VARCHAR(255),
  severity_index INT2
);

CREATE TABLE diagnoses
(
  id SERIAL8 PRIMARY KEY,
  disease_id INT8 REFERENCES diseases(id),
  patient_id INT8 REFERENCES patients(id),
  date_of_diagnosis VARCHAR(10),
  severity_score INT2,
  disease_active VARCHAR(5),
  date_of_resolution VARCHAR(10)
);
