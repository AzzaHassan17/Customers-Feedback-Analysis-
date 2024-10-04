
CREATE DATABASE CustomerFeedbackDB;

USE CustomerFeedbackDB;


CREATE TABLE Customer_Profiles (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    contact_info VARCHAR(100),
    demographics VARCHAR(100)
);

CREATE TABLE Feedback_Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);
CREATE TABLE Product_Categories (
    product_category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(500),
    product_category_id INT,
    FOREIGN KEY (product_category_id) REFERENCES Product_Categories(product_category_id)
);

CREATE TABLE Feedback_Forms (
    feedback_id INT PRIMARY KEY,
    customer_id INT,
	product_id  INT,
    feedback_text TEXT,
    feedback_date DATETIME,
    category_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer_Profiles(customer_id),
    FOREIGN KEY (category_id) REFERENCES Feedback_Categories(category_id),
	FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Customer_Demographics (
    demographic_id INT PRIMARY KEY,
    customer_id INT,
    gender VARCHAR(50),
    location VARCHAR(100),
    FOREIGN KEY (customer_id) REFERENCES Customer_Profiles(customer_id)
);

CREATE TABLE Customer_Interactions (
    interaction_id INT PRIMARY KEY,
    customer_id INT,
    interaction_type VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customer_Profiles(customer_id)
);














