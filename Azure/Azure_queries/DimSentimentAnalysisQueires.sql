SELECT TOP (1000) [Sentiment]
,[Score]
,[feedback_id]
 FROM [CustomersFeedbackdw].[dbo].[DimSentimentAnalysis]
 -----------------------------------------------------------------------
 -- Filtering Feedback Based on Sentiment Score

 SELECT 
    C.customer_name,
    P.product_name,
    F.feedback_text,
    SA.Score
FROM 
   [CustomersFeedbackdw].[dbo].[FactFeedback] F
JOIN 
    [CustomersFeedbackdw].[dbo].[DimCustomers] C ON F.customer_id = C.customer_id
JOIN 
    [CustomersFeedbackdw].[dbo].[DimProduct] P ON F.product_id = P.product_id
JOIN 
    [CustomersFeedbackdw].[dbo].[DimSentimentAnalysis] SA ON F.feedback_id = SA.feedback_id
WHERE 
    SA.Score > 0.998;
