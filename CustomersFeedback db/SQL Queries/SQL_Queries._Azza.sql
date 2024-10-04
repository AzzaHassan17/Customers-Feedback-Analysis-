USE CustomerFeedbackDB

---1)Get All Customer Feedback along with customers information, feedback categories , and feedback IDs in a descending order
SELECT 
    f.feedback_id,
    cp.customer_name,
    f.feedback_text,
    f.feedback_date,
    fc.category_name
FROM 
    Feedback_Forms f
JOIN 
    Customer_Profiles cp ON f.customer_id = cp.customer_id
JOIN 
    Feedback_Categories fc ON f.category_id = fc.category_id
ORDER BY 
    f.feedback_date DESC;

------------------------------------------------------------------------------------------------------------------

---2) Count Feedbacks by Category
SELECT 
    fc.category_name,
    COUNT(f.feedback_id) AS feedback_count
FROM 
    Feedback_Forms f
JOIN 
    Feedback_Categories fc ON f.category_id = fc.category_id
GROUP BY 
    fc.category_name
ORDER BY 
    feedback_count DESC;
-------------------------------------------------------------------------------------------------------

---3)Feedback Trend Over Time (retrieves feedback counts grouped by month to analyze trends)

SELECT 
    FORMAT(feedback_date, 'yyyy-MM') AS feedback_month,
    COUNT(feedback_id) AS feedback_count
FROM 
    Feedback_Forms
GROUP BY 
    FORMAT(feedback_date, 'yyyy-MM')
ORDER BY 
    feedback_month;

------------------------------------------------------------------------------------------------------------

---4)Top customers by feedback submissions (customers who submit the most feedback:)
SELECT c.customer_id, c.customer_name, COUNT(f.feedback_id) AS feedback_count
FROM feedback_forms f
JOIN customer_profiles c ON f.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY feedback_count DESC;

--------------------------------------------------------------------------------------------------------------

---5) Customers with no feedback
SELECT c.customer_id, c.customer_name
FROM customer_profiles c
LEFT JOIN feedback_forms f ON c.customer_id = f.customer_id
WHERE f.feedback_id IS NULL;

---------------------------------------------------------------------------------------------------------------

---6) Most common feedback categories per customer (To find the most frequent feedback category each customer has submitted)
SELECT c.customer_name, fc.category_name, COUNT(f.feedback_id) AS feedback_count
FROM feedback_forms f
JOIN customer_profiles c ON f.customer_id = c.customer_id
JOIN feedback_categories fc ON f.category_id = fc.category_id
GROUP BY c.customer_name, fc.category_name
ORDER BY feedback_count DESC;
-------------------------------------------------------------------------------------------------------------------

