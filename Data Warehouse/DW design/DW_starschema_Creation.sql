
CREATE DATABASE CustomerFeedbackDW;
GO

USE CustomerFeedbackDW;
GO

-- Create dimension tables including Product Categories
CREATE TABLE DimCustomer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    contact_info VARCHAR(100),
    demographics VARCHAR(100)
);

CREATE TABLE DimProductCategory (
    product_category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE DimProduct (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(500),
    product_category_id INT,
    FOREIGN KEY (product_category_id) REFERENCES DimProductCategory(product_category_id)
);

CREATE TABLE DimCategory (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);


CREATE TABLE FactFeedback (
    feedback_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    category_id INT,
    feedback_text TEXT,
    FOREIGN KEY (customer_id) REFERENCES DimCustomer(customer_id),
    FOREIGN KEY (product_id) REFERENCES DimProduct(product_id),
    FOREIGN KEY (category_id) REFERENCES DimCategory(category_id)
   
);
GO
