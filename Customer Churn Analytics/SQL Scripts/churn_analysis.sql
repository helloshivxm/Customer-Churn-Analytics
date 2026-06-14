create database customer_churn_analytics;
use customer_churn_analytics;
SHOW TABLES;
SELECT COUNT(*)
FROM customer_churn;
SELECT churn,
	   COUNT(*) AS Total_Customers
FROM customer_churn
group by Churn;
SELECT Gender,
	   COUNT(*)
FROM customer_churn
group by Gender;
select Gender,
       Churn,
       COUNT(*)
FROM customer_churn
group by Gender, churn;
select churn,
       COUNT(*) AS Total_Customers,
       ROUND(COUNT(*) * 100.0/7043, 2) AS Percentage
       From customer_churn
       group by Churn;
Select churn,
       Count(*) AS Total_Customers,
       ROUND(COUNT(*)* 100.0/(Select Count(*) From customer_churn),
       2) as Percentage
From customer_churn
group by Churn;
select *
from customer_churn
where churn='Yes';
select count(*)
from customer_churn
where churn='Yes';
SELECT Contract,
       COUNT(*) AS Total_Customers
FROM customer_churn
GROUP BY Contract;
SELECT Contract,
       COUNT(*) AS Total_Customers
FROM customer_churn
WHERE Churn='Yes'
GROUP BY Contract;
SELECT Contract,
       COUNT(*) AS Total_Customers,
       SUM(CASE WHEN Churn='Yes' THEN 1
ELSE 0 END) AS Churned_Customers,
round(
      SUM(CASE WHEN Churn='Yes' THEN 1
ELSE 0 END)*100.0
          / COUNT(*),
          2
          ) AS Churn_Rate
FROM customer_churn
GROUP BY Contract;
SELECT TechSupport,
       COUNT(*) AS Total_Customers,
       SUM(CASE WHEN Churn='Yes' THEN 1
ELSE 0 END) AS Churned_Customers,
       ROUND(
            SUM(CASE WHEN Churn='Yes' THEN 1
ELSE 0 END)*100.0
           / COUNT(*),
           2
		) AS Churn_Rate
FROM customer_churn
GROUP BY TechSupport;
SELECT OnlineSecurity,
       COUNT(*) AS Total_Customers,
       SUM(CASE WHEN Churn='Yes' THEN 1
ELSE 0 END) AS Churned_Customers,
       ROUND(
            SUM(CASE WHEN Churn='Yes' THEN 1
ELSE 0 END)*100.0
           / COUNT(*),
           2
		) AS Churn_Rate
FROM customer_churn
GROUP BY OnlineSecurity;
SELECT PaymentMethod,
       COUNT(*) AS Total_Customers,
       SUM(CASE WHEN Churn='Yes' THEN 1
ELSE 0 END) AS Churned_Customers,
       ROUND(
            SUM(CASE WHEN Churn='Yes' THEN 1
ELSE 0 END)*100.0
           / COUNT(*),
           2
		) AS Churn_Rate
FROM customer_churn
GROUP BY PaymentMethod;
SELECT 
      Contract,
      PaymentMethod,
       COUNT(*) AS Total_Customers,
       SUM(CASE WHEN Churn='Yes' THEN 1
ELSE 0 END) AS Churned_Customers,
       ROUND(
            SUM(CASE WHEN Churn='Yes' THEN 1
ELSE 0 END)*100.0
           / COUNT(*),
           2
		) AS Churn_Rate
FROM customer_churn
GROUP BY Contract, PaymentMethod
ORDER BY Churn_Rate DESC;
SELECT Churn,
	 ROUND(AVG(MonthlyCharges), 2) AS Avg_Monthly_Charges
FROM customer_churn
GROUP BY Churn;