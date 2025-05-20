-- Monthly Sales Trend Analysis

-- 1. Monthly Revenue and Order Volume
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM
    online_sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    year,
    month;

-- 2. Top 3 Months by Revenue
SELECT
    TO_CHAR(order_date, 'YYYY-MM') AS month_year,
    SUM(amount) AS total_revenue
FROM
    online_sales
GROUP BY
    TO_CHAR(order_date, 'YYYY-MM')
ORDER BY
    total_revenue DESC
LIMIT 3;
