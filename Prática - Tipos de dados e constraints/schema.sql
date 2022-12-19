CREATE DATABASE ecommerce;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

CREATE TABLE user_addresses (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    description VARCHAR(50) NOT NULL,
    postal_code VARCHAR(8) NOT NULL,
    street VARCHAR(50) NOT NULL,
    number INTEGER NOT NULL,
    complement VARCHAR(50),
    district VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(2) NOT NULL,
    reference VARCHAR(50)
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    category_id INTEGER NOT NULL REFERENCES categories(id),
    name VARCHAR(50) NOT NULL,
    price INTEGER NOT NULL,
    size VARCHAR(20) NOT NULL
);

CREATE TABLE product_images (
    id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL REFERENCES products(id),
    url TEXT NOT NULL,
    main BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE order_status (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO order_status (name) VALUES ('criada'), ('paga'), ('entregue'), ('cancelada');

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    user_address_id INTEGER NOT NULL REFERENCES user_addresses(id),
    order_status_id INTEGER NOT NULL REFERENCES order_status(id) DEFAULT 1,
    order_date DATE NOT NULL DEFAULT NOW()
);

CREATE TABLE order_products (
    id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL REFERENCES orders(id),
    product_id INTEGER NOT NULL REFERENCES products(id),
    quantity INTEGER NOT NULL,
    price INTEGER NOT NULL
);
