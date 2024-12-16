CREATE DATABASE goalgetter_db;

USE goalgetter_db;

CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    due_date DATE,
    status ENUM(
        'pas commence',
        'en cours',
        'termine'
    ) DEFAULT 'pas commence',
    category ENUM(
        'etude',
        'travail',
        'maison',
        'personnel',
        'loisirs',
        'autre'
    ),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);