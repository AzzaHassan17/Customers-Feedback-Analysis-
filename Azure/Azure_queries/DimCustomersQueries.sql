SELECT TOP (600) [customer_id]
,[customer_name]
,[contact_info]
,[demographics]
 FROM [CustomersFeedbackdw].[dbo].[DimCustomers]
 --------------------------------------------------
 -- Aggregating Feedback Count Per Customer

 SELECT 
    C.customer_name,
    COUNT(F.feedback_id) AS feedback_count
FROM 
    [CustomersFeedbackdw].[dbo].[FactFeedback] F
JOIN 
    [CustomersFeedbackdw].[dbo].[DimCustomers] C ON F.customer_id = C.customer_id
GROUP BY 
    C.customer_name
ORDER BY 
    feedback_count DESC; 
