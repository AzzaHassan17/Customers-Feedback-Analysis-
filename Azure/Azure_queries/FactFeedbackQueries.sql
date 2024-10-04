SELECT TOP (1000) [feedback_id]
,[customer_id]
,[product_id]
,[category_id]
,[feedback_text]
 FROM [CustomersFeedbackdw].[dbo].[FactFeedback]
 ---------------------------------------------------------------
 --- Connecting Feedback with Customer, Product, Category, and Sentiment Analysis
 SELECT 
    C.customer_name,
    P.product_name,
    PC.category_name AS product_category,
    F.feedback_text,
    SA.Sentiment,
    SA.Score
FROM 
    [CustomersFeedbackdw].[dbo].[FactFeedback] F
JOIN 
    [CustomersFeedbackdw].[dbo].[DimCustomers] C ON F.customer_id = C.customer_id
JOIN 
   [CustomersFeedbackdw].[dbo].[DimProduct] P ON F.product_id = P.product_id
JOIN 
    [CustomersFeedbackdw].[dbo].[DimProductCategory] PC ON P.product_category_id = PC.product_category_id
JOIN 
    [CustomersFeedbackdw].[dbo].[DimSentimentAnalysis] SA ON F.feedback_id = SA.feedback_id;


------------------------------------------------------------------------

-- Aggregating Feedback Based on Sentiment and Grouping by Product
SELECT 
    P.product_name,
    COUNT(F.feedback_id) AS total_feedback,
    AVG(SA.Score) AS avg_sentiment_score
FROM 
    [CustomersFeedbackdw].[dbo].[FactFeedback] F
JOIN 
    [CustomersFeedbackdw].[dbo].[DimProduct] P ON F.product_id = P.product_id
JOIN 
    [CustomersFeedbackdw].[dbo].[DimSentimentAnalysis] SA ON F.feedback_id = SA.feedback_id
GROUP BY 
    P.product_name
ORDER BY 
    avg_sentiment_score DESC;
------------------------------------------------------------------------


