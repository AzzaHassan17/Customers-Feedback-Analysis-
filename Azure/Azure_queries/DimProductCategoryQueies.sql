SELECT TOP (100) [product_category_id]
,[category_name]
 FROM [CustomersFeedbackdw].[dbo].[DimProductCategory]
 -------------------------------------------------------------------
 -- Grouping by Category to See Total Feedback Per Category
 SELECT 
    PC.category_name,
    COUNT(F.feedback_id) AS total_feedback
FROM 
    [CustomersFeedbackdw].[dbo].[FactFeedback] F
JOIN 
    [CustomersFeedbackdw].[dbo].[DimProduct] P ON F.product_id = P.product_id
JOIN 
    [CustomersFeedbackdw].[dbo].[DimProductCategory] PC ON P.product_category_id = PC.product_category_id
GROUP BY 
    PC.category_name
ORDER BY 
    total_feedback DESC;
----------------------------------------------------------------------------------------------------------
