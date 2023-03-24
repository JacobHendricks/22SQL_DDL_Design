-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/60vFsW
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Doctors" (
    "doctor_id" serial   NOT NULL,
    "first_name" text   NOT NULL,
    "last_name" text   NOT NULL,
    "specialty" text   NOT NULL,
    CONSTRAINT "pk_Doctors" PRIMARY KEY (
        "doctor_id"
     )
);

CREATE TABLE "Patients" (
    "patient_id" serial   NOT NULL,
    "first_name" text   NOT NULL,
    "last_name" text   NOT NULL,
    "birthday" date   NOT NULL,
    "insurance" text   NOT NULL,
    CONSTRAINT "pk_Patients" PRIMARY KEY (
        "patient_id"
     )
);

CREATE TABLE "Diseases" (
    "disease_id" serial   NOT NULL,
    "name" text   NOT NULL,
    "description" text   NOT NULL,
    CONSTRAINT "pk_Diseases" PRIMARY KEY (
        "disease_id"
     )
);

CREATE TABLE "Visits" (
    "id" serial   NOT NULL,
    "patient_id" int   NOT NULL,
    "doctor_id" int   NOT NULL,
    "date" date   NOT NULL,
    CONSTRAINT "pk_Visits" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Diagnoses" (
    "id" serial   NOT NULL,
    "visit_id" int   NOT NULL,
    "disease_id" int   NOT NULL,
    "notes" text   NULL,
    CONSTRAINT "pk_Diagnoses" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_patient_id" FOREIGN KEY("patient_id")
REFERENCES "Patients" ("patient_id");

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "Doctors" ("doctor_id");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_visit_id" FOREIGN KEY("visit_id")
REFERENCES "Visits" ("id");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_disease_id" FOREIGN KEY("disease_id")
REFERENCES "Diseases" ("disease_id");

