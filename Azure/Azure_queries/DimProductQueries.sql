SELECT TOP (1000) [product_id]
,[product_name]
,[product_category_id]
 FROM [CustomersFeedbackdw].[dbo].[DimProduct]
 ------------------------------------------------------------

 -- Feedback Count by Product

 SELECT 
    P.product_name,
    COUNT(F.feedback_id) AS total_feedback
FROM 
    [CustomersFeedbackdw].[dbo].[FactFeedback] F
JOIN 
   [CustomersFeedbackdw].[dbo].[DimProduct] P ON F.product_id = P.product_id
GROUP BY 
    P.product_name
ORDER BY 
    total_feedback DESC;
---------------------------------------------------------------------------------------

-- Products with Most Positive Feedback
SELECT 
    P.product_name,
    COUNT(F.feedback_id) AS total_positive_feedback,
    AVG(SA.Score) AS avg_positive_sentiment_score
FROM 
    [CustomersFeedbackdw].[dbo].[FactFeedback] F
JOIN 
    [CustomersFeedbackdw].[dbo].[DimProduct] P ON F.product_id = P.product_id
JOIN 
    [CustomersFeedbackdw].[dbo].[DimSentimentAnalysis] SA ON F.feedback_id = SA.feedback_id
WHERE 
    SA.Sentiment = 'POSITIVE'  and SA.Score > 0.99
GROUP BY 
    P.product_name
ORDER BY 
    avg_positive_sentiment_score DESC;
