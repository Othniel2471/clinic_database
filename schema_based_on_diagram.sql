CREATE TABLE medical_histories(
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP NOT NULL,
    patient_id INT NOT NULL,
    status VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE patients(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(225) NOT NULL,
    date_of_birth DATE NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE treatments (
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(100) NOT NULL,
    name VARCHAR(225) NOT NULL
);

ALTER TABLE treatments
ADD CONSTRAINT treatments_pk PRIMARY KEY (id);

ALTER TABLE medical_histories
ADD CONSTRAINT medical_histories_fk FOREIGN KEY (patient_id) REFERENCES patients (id);