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

create table invoices (
  id int generated always as identity,
  total_amount decimal(10,2) not null,
  generated_at TIMESTAMP,
  payed_At timestamp,
  medical_history_id int
);

alter table invoices
  add constraint invoices_pk
    primary key (id);

create table invoice_items (
  id int generated always as identity,
  unit_price decimal(10,2) not null,
  quantity int not null,
  total_price decimal(10,2) not null,
  invoice_id int not null,
  treatment_id int not null,
  primary key (id)
);

alter table invoice_items
add constraint invoices_fk
  foreign key (invoice_id) references invoices (id);

alter table invoice_items
add constraint invoice_items_fk
  foreign key (treatment_id) references treatments (id);

alter table invoices
add constraint invoices_fk
  foreign key (medical_history_id) references medical_histories (id);

ALTER TABLE medical_histories
ADD CONSTRAINT fk_medical_histories_treatments
FOREIGN KEY (id) REFERENCES treatments(id);

CREATE TABLE medical_histories_treatment (
    medical_history_id INT NOT NULL,
    treatment_id INT NOT NULL,
    CONSTRAINT fk_medical_history FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id),
    CONSTRAINT fk_treatment FOREIGN KEY(treatment_id) REFERENCES treatments(id)
);

CREATE INDEX patients_idx ON medical_histories (patient_id);

create index invoices_idx on invoices(id);

create index medical_histories_idx on medical_histories(id);

create index treatments_index on treatments(id);

create index med_treatment_idx on treatments(id);

create index med_history_treatment_idx on medical_histories_treatment(medical_history_id);

