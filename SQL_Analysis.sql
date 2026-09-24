-- E-Commerce Sales & Profit Analysis
-- Database: PostgreSQL

-- 1. Overall KPIs
SELECT
    COUNT(*) AS total_orders,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin
FROM ecommerce_sales;


-- 2. Monthly Sales & Profit
SELECT
    DATE_TRUNC('month', order_date) AS month,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM ecommerce_sales
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;


-- 3. Sales by Category
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales
FROM ecommerce_sales
GROUP BY category
ORDER BY total_sales DESC;


-- 4. Profit by Category
SELECT
    category,
    ROUND(SUM(profit), 2) AS total_profit
FROM ecommerce_sales
GROUP BY category
ORDER BY total_profit DESC;


-- 5. Sales by Region/City
SELECT
    region_city,
    ROUND(SUM(sales), 2) AS total_sales
FROM ecommerce_sales
GROUP BY region_city
ORDER BY total_sales DESC;


-- 6. Top 10 Products by Sales
SELECT
    product,
    ROUND(SUM(sales), 2) AS total_sales
FROM ecommerce_sales
GROUP BY product
ORDER BY total_sales DESC
LIMIT 10;


-- 7. Product Profitability
SELECT
    product,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin
FROM ecommerce_sales
GROUP BY product
ORDER BY total_profit DESC;


-- 8. Customer Type Analysis
SELECT
    customer_type,
    COUNT(*) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM ecommerce_sales
GROUP BY customer_type
ORDER BY total_sales DESC;


-- 9. Payment Method Analysis
SELECT
    payment_method,
    COUNT(*) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM ecommerce_sales
GROUP BY payment_method
ORDER BY total_sales DESC;


-- 10. Discount vs Profit Analysis
SELECT
    product,
    ROUND(AVG(discount), 2) AS avg_discount,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM ecommerce_sales
GROUP BY product
ORDER BY avg_discount DESC;
