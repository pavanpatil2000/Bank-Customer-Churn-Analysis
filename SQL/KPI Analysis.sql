SELECT 
    exited,
    COUNT(*) AS total_customers,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customers), 2) AS percentage
FROM customers
GROUP BY exited;

SELECT 
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(SUM(exited) * 100.0 / COUNT(*), 2) AS churn_rate_percentage
FROM customers;

SELECT 
    geography,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(SUM(exited) * 100.0 / COUNT(*), 2) AS churn_rate_percentage
FROM customers
GROUP BY geography
ORDER BY churn_rate_percentage DESC;

SELECT 
    isactivemember,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(SUM(exited) * 100.0 / COUNT(*), 2) AS churn_rate_percentage
FROM customers
GROUP BY isactivemember;

SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 30 THEN '18-30'
        WHEN age BETWEEN 31 AND 45 THEN '31-45'
        WHEN age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(SUM(exited) * 100.0 / COUNT(*), 2) AS churn_rate_percentage
FROM customers
GROUP BY age_group
ORDER BY churn_rate_percentage DESC;

SELECT 
    ROUND(SUM(balance),2) AS total_balance,
    ROUND(SUM(CASE WHEN exited = 1 THEN balance ELSE 0 END),2) AS revenue_at_risk
FROM customers;

SELECT 
    CASE 
        WHEN balance = 0 THEN 'Zero Balance'
        WHEN balance BETWEEN 1 AND 50000 THEN 'Low Balance'
        WHEN balance BETWEEN 50001 AND 150000 THEN 'Medium Balance'
        ELSE 'High Balance'
    END AS balance_category,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(SUM(exited) * 100.0 / COUNT(*), 2) AS churn_rate_percentage
FROM customers
GROUP BY balance_category
ORDER BY churn_rate_percentage DESC;

SELECT 
    geography,
    isactivemember,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(SUM(exited) * 100.0 / COUNT(*), 2) AS churn_rate_percentage
FROM customers
GROUP BY geography, isactivemember
ORDER BY churn_rate_percentage DESC;

SELECT 
    geography,
    isactivemember,
    ROUND(SUM(balance),2) AS total_balance,
    ROUND(SUM(CASE WHEN exited = 1 THEN balance ELSE 0 END),2) AS revenue_at_risk
FROM customers
GROUP BY geography, isactivemember
ORDER BY revenue_at_risk DESC;