CREATE VIEW vw_customers_clean AS
SELECT
    customerid,
    surname,
    creditscore,
    geography,
    gender,
    age,
    tenure,
    balance,
    numofproducts,
    hascrcard,
    isactivemember,
    estimatedsalary,
    exited,

    CASE 
        WHEN age BETWEEN 18 AND 30 THEN '18-30'
        WHEN age BETWEEN 31 AND 45 THEN '31-45'
        WHEN age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS age_group,

    CASE 
        WHEN balance = 0 THEN 'Zero Balance'
        WHEN balance BETWEEN 1 AND 50000 THEN 'Low Balance'
        WHEN balance BETWEEN 50001 AND 150000 THEN 'Medium Balance'
        ELSE 'High Balance'
    END AS balance_category,

    CASE 
        WHEN isactivemember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS activity_status

FROM customers;


SELECT table_name
FROM information_schema.views
WHERE table_name = 'vw_customers_clean';

SELECT * 
FROM vw_customers_clean
LIMIT 10;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'vw_customers_clean';

SELECT COUNT(*) FROM vw_customers_clean;