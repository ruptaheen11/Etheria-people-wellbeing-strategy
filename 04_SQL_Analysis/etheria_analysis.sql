USE etheria;

SELECT count(Employee_id)
FROM mental_health_workers 
WHERE Mental_Health_Status = "Poor" AND Has_Access_To_Therapist="No" ;


SELECT CASE WHEN Sleep_Hours_Per_Day BETWEEN 4 AND 5 THEN "POOR"
WHEN Sleep_Hours_Per_Day > 5 AND Sleep_Hours_Per_Day <=7 THEN "MODERATE"
ELSE "GOOD"
END AS Sleep_Status,
ROUND(AVG(Burnout_Score), 2) AS Avg_Burnout
FROM mental_health_workers
GROUP BY Sleep_Status
ORDER BY Avg_Burnout DESC;

SELECT CASE WHEN Hours_Worked_Per_Week> 45
THEN "OVERWORK"
ELSE "NORMAL"
END AS Workload, 
ROUND(AVG(Burnout_Score),2) AS Avg_Burnout
FROM mental_health_workers
GROUP BY Workload
ORDER BY Avg_Burnout DESC;

SELECT Exercise_Frequency,
ROUND(AVG(Burnout_Score), 2) AS Avg_Burnout
FROM mental_health_workers
GROUP BY Exercise_Frequency
ORDER BY Avg_Burnout DESC;

SELECT Work_Mode, ROUND(AVG(Burnout_Score),2) AS Avg_Burnout
FROM mental_health_workers
GROUP BY Work_Mode
ORDER BY Avg_Burnout DESC;


SELECT Work_Mode, COUNT(*) AS TOTAL_EMPLOYEES,
ROUND(AVG(Productivity_Score),2) AS AVG_Productivity,
ROUND(AVG(Work_Life_Balance_Rating),2) AS AVG_Work_Life_Balance
FROM mental_health_workers
GROUP BY Work_Mode
ORDER BY AVG_Productivity DESC;

SELECT 
    Job_Role,
    COUNT(*) AS Total_Employees,
    SUM(Mental_Health_Status = "Poor") AS Poor_Count,
    ROUND(AVG(Burnout_Score), 2) AS Avg_Burnout
FROM mental_health_workers
GROUP BY Job_Role
ORDER BY Avg_Burnout DESC;

SELECT 
    Job_Role,
    COUNT(*) AS Total_Employees,
    SUM(Mental_Health_Status = "Poor") AS Poor_Count,
	ROUND(SUM(Mental_Health_Status = "Poor")*100 /  COUNT(*) ,1) AS POOR_PERCENT,
    ROUND(AVG(Burnout_Score), 2) AS Avg_Burnout
FROM mental_health_workers
GROUP BY Job_Role
ORDER BY Avg_Burnout DESC;

SELECT Has_Access_To_Therapist, COUNT(*) AS Employee_Count,
ROUND(AVG(Burnout_Score),2) AS Avg_Burnout
FROM mental_health_workers
GROUP BY Has_Access_To_Therapist;

SELECT Work_Mode, Mental_Health_Status,
ROUND (AVG(Burnout_Score),2) AS Avg_Burnout
FROM mental_health_workers
GROUP BY Work_Mode, Mental_Health_Status
ORDER BY Avg_Burnout DESC ;

SELECT Country, 
count(*) AS POPULATION,
ROUND (AVG(Burnout_Score),2) AS Avg_Burnout
FROM mental_health_workers
GROUP BY Country
ORDER BY Avg_Burnout DESC;

SELECT Employee_ID, Job_Role, Burnout_Score 
FROM mental_health_workers
WHERE Burnout_Score >
(SELECT AVG(Burnout_Score ) FROM mental_health_workers);

