USE CustomerFeedbackDW;
GO
-- Insert into DimCustomer
INSERT INTO DimCustomer (customer_id, customer_name, contact_info, demographics)
SELECT DISTINCT customer_id, customer_name, contact_info, demographics
FROM CustomerFeedbackDB.dbo.Customer_Profiles;

-- Insert into DimCategory
INSERT INTO DimCategory (category_id, category_name)
SELECT DISTINCT category_id, category_name
FROM CustomerFeedbackDB.dbo.Feedback_Categories;

-- Insert into DimProductCategory
INSERT INTO DimProductCategory (product_category_id, category_name)
SELECT DISTINCT product_category_id, category_name
FROM CustomerFeedbackDB.dbo.Product_Categories;

-- Insert into DimProduct with a reference to DimProductCategory
INSERT INTO DimProduct (product_id, product_name, product_category_id)
SELECT 
    product_id, 
    product_name, 
    product_category_id
FROM CustomerFeedbackDB.dbo.Products;


--- Insert into FactFeedback
INSERT INTO FactFeedback (feedback_id, customer_id, product_id, category_id, feedback_text)
SELECT 
    f.feedback_id,
    f.customer_id,
    f.product_id,
    cat.category_id,  
    f.feedback_text
FROM CustomerFeedbackDB.dbo.Feedback_Forms f
JOIN DimProduct p ON f.product_id = p.product_id
JOIN DimCategory cat ON f.category_id = cat.category_id;
-----------------------------------------------------------------------------------------------------
USE CustomerFeedbackDW;
SELECT * FROM dbo.DimCustomer;
SELECT * FROM dbo.DimProductCategory;
SELECT * FROM dbo.DimProduct;
SELECT * FROM dbo.DimCategory;
SELECT * FROM dbo.FactFeedback;
