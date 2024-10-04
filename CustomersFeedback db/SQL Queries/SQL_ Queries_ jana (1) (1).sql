

---1.Customers Who Gave Feedback in Multiple Categories

SELECT 
    cu.customer_name, 
    COUNT(DISTINCT f.category_id) AS CategoryCount
FROM 
    Customer_Profiles cu
JOIN 
    Feedback_Forms f ON cu.customer_id = f.customer_id
GROUP BY 
    cu.customer_name
HAVING 
    COUNT(DISTINCT f.category_id) > 1;

------------------------------------------------------------------------------------------------------------

----2.Feedback Text Containing a Keyword

SELECT 
    f.feedback_date, 
    cu.customer_name, 
    f.feedback_text 
FROM 
    Feedback_Forms f
JOIN 
    Customer_Profiles cu ON f.customer_id = cu.customer_id
WHERE 
    f.feedback_text LIKE '%' + 'product' + '%';
-----------------------------------------------------------------------------------------------------------

---3.Feedback Distribution by Demographics

SELECT 
    Demographics, 
    COUNT(f.Feedback_ID) AS FeedbackCount
FROM 
    Customer_Profiles c
JOIN 
    Feedback_Forms f ON c.customer_id = f.customer_id
GROUP BY 
    Demographics;
------------------------------------------------------------------------------------------------------------
---4.Common Words in Feedback Text

SELECT 
    SUBSTRING(f.feedback_text, PATINDEX('%Great%', f.feedback_text), LEN('Great')) AS CommonWord,
    COUNT(f.feedback_id) AS Frequency
FROM 
    Feedback_Forms f
WHERE 
    f.feedback_text LIKE '%Great%'
GROUP BY 
    SUBSTRING(f.feedback_text, PATINDEX('%Great%', f.feedback_text), LEN('Great'));
-----------------------------------------------------------------------------------------------------------
---5.Find feedbacks given in the last month
SELECT 
    f.feedback_date, 
    c.customer_name, 
    f.feedback_text, 
    cat.category_name
FROM 
    Feedback_Forms f
JOIN 
    Customer_Profiles c ON f.customer_id = c.customer_id
JOIN 
    Feedback_Categories cat ON f.category_id = cat.category_id
WHERE 
    f.feedback_date >= DATEADD(MONTH, -1, GETDATE());

