CREATE DATABASE course;

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE
);

CREATE TABLE classes (
    id SERIAL PRIMARY KEY,
    code TEXT NOT NULL UNIQUE
);

CREATE TABLE students_classes (
    id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL REFERENCES students(id),
    class_id INTEGER NOT NULL REFERENCES classes(id),
    entered_at DATE NOT NULL DEFAULT NOW(),
    left_at DATE
);

CREATE TABLE modules (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    module_id INTEGER NOT NULL REFERENCES modules(id)
);

CREATE TABLE evaluations (
    id SERIAL PRIMARY KEY,
    description TEXT NOT NULL UNIQUE
);

INSERT INTO
    evaluations (description)
VALUES
    ('Abaixo das Expectativas'),
    ('Dentro das Expectativas'),
    ('Acima das Expectativas')
;

CREATE TABLE students_projects (
    id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL REFERENCES students(id),
    project_id INTEGER NOT NULL REFERENCES projects(id),
    submission TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    evalutation_id INTEGER REFERENCES evaluations(id)
);
