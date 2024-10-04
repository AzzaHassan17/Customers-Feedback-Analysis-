SELECT TOP (100) [category_id]
,[category_name]
 FROM [CustomersFeedbackdw].[dbo].[DimCategories]
 -----------------------------------------------------
 -- Feedback Count by Feedback Category
 SELECT 
    DC.category_name,
    COUNT(F.feedback_id) AS total_feedback
FROM 
    [CustomersFeedbackdw].[dbo].[FactFeedback] F
JOIN 
    [CustomersFeedbackdw].[dbo].[DimCategories] DC ON F.category_id = DC.category_id
GROUP BY 
    DC.category_name
ORDER BY 
    total_feedback DESC;
---------------------------------------------------
-- Feedback with Category Names and Sentiment Scores

SELECT 
    DC.category_name,
    COUNT(F.feedback_id) AS total_feedback,
    AVG(SA.Score) AS avg_sentiment_score
FROM 
    [CustomersFeedbackdw].[dbo].[FactFeedback] F
JOIN 
    [CustomersFeedbackdw].[dbo].[DimCategories] DC ON F.category_id = DC.category_id
JOIN 
    [CustomersFeedbackdw].[dbo].[DimSentimentAnalysis] SA ON F.feedback_id = SA.feedback_id
GROUP BY 
    DC.category_name
ORDER BY 
    avg_sentiment_score DESC;

