# _{Application Name}_

---

{Brief description of application}, 10/6/2020

By **{List of contributors}**

## Description

{Description}

## Setup/Installation Requirements

{Setup Requirements}

## Known Bugs

{Known Bugs}

## Support and contact details

{Contact Details}

## Technologies Used

{Technologies Used}

## User Stories

-As a doctor, want to see list of patients
-As an administrator, want to add a doctor with name and speciality, add a patient with name and with birthdate.
-As an administrator, want to assign patients to doctors, one to many.

### License

{License}

Copyright (c) 2020 **_{List of contributors}_**

### SQL Statements for DB Setup

CREATE TABLE "doctor" (
"id" serial PRIMARY KEY,
"name" varchar,
"specialty" varchar
);

CREATE TABLE "patient" (
"id" serial PRIMARY KEY,
"name" varchar,
"birthdate" date,
"doctor_id" integer
);
