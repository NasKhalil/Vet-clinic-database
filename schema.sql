/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id integer GENERATED ALWAYS AS IDENTITY,
    animal_name varchar(100),
    date_of_birth date NOT NULL,
    escape_attempts integer,
    neutered boolean NOT NULL,
    weight_per_kg decimal NOT NULL,
    PRIMARY KEY(id)
);

/* update table, add new column "species" */

ALTER TABLE animals ADD COLUMN species varchar(50);

/* Create owners table */
CREATE TABLE owners (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 full_name VARCHAR(50),
 age INT
);

/* Create species table */
CREATE TABLE species (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 name VARCHAR(50)
);

-- Alter Animals Table
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_name FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_name2 FOREIGN KEY(owner_id) REFERENCES owners(id);