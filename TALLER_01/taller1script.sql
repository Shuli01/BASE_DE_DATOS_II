CREATE DATABASE talleruno;
USE talleruno;

CREATE TABLE Product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(5,2) NOT NULL
);

CREATE TABLE Category (
    name VARCHAR(50) PRIMARY KEY
);

CREATE TABLE ProductCategory (
    product_id INT,
    category_name VARCHAR(50),
    PRIMARY KEY (product_id, category_name),
    FOREIGN KEY (product_id) REFERENCES Product(id),
    FOREIGN KEY (category_name) REFERENCES Category(name) 
);

CREATE TABLE `order` (
    id INT PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE Order_Line (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `Order`(id),
    FOREIGN KEY (product_id) REFERENCES Product(id)
);

CREATE TABLE Food (
    product_id INT PRIMARY KEY,
    expiration_date DATE NOT NULL,
    calories INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Product(id)
);

CREATE TABLE Furniture (
    product_id INT PRIMARY KEY,
    manufacture_date DATE NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Product(id)
);
