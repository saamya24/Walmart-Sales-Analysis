SELECT * FROM walmart.`m5 sampled test`;

-- Sales Analysis--
-- 1. Total Sales for the Month--
SELECT SUM(demand) as total_sales
FROM walmart.`m5 sampled test`
WHERE date >= '2016-03-29' AND date <= '2016-04-25';

-- 2. Average Daily Sales--
SELECT AVG(demand) as avg_daily_sales
FROM walmart.`m5 sampled test`;

-- 3. Sales over time--
SELECT date, SUM(demand) as daily_sales
FROM walmart.`m5 sampled test`
WHERE date >= '2016-03-29' AND date <= '2016-04-25'
GROUP BY date;

-- 4. Top selling items-- 
SELECT item_id, SUM(demand) as total_sales
FROM walmart.`m5 sampled test`
GROUP BY item_id
ORDER BY total_sales DESC
LIMIT 5;

-- 5. Sales by department--
SELECT dept_id, SUM(demand) as total_sales
FROM walmart.`m5 sampled test`
GROUP BY dept_id;

-- Store Analysis--
-- 1. Store- wise sals-- 
SELECT store_id, SUM(demand) as total_sales
FROM walmart.`m5 sampled test`
GROUP BY store_id;

-- 2. Store with Highest Sales--
SELECT store_id, SUM(demand) as total_sales
FROM walmart.`m5 sampled test`
GROUP BY store_id
ORDER BY total_sales DESC
LIMIT 1;

-- Location Analysis--
-- 1. Sales by state--
SELECT state_id, SUM(demand) as total_sales
FROM walmart.`m5 sampled test`
GROUP BY state_id;

-- Demand Analysis--
-- 1. Items with highest demands--
SELECT item_id, SUM(demand) as total_demand
FROM walmart.`m5 sampled test`
GROUP BY item_id
ORDER BY total_demand DESC
LIMIT 5;

-- 2. Demand over time--
SELECT date, SUM(demand) as daily_demand
FROM walmart.`m5 sampled test`
WHERE date >= '2016-03-29' AND date <= '2016-04-25'
GROUP BY date;

-- Category Analysis--
-- 1. Sales by category--
SELECT cat_id, SUM(demand) as total_sales
FROM walmart.`m5 sampled test`
GROUP BY cat_id;

-- Trend Analysis--
-- 1. Weekly trend--
SELECT WEEK(date) as week_number, AVG(demand) as avg_weekly_sales
FROM walmart.`m5 sampled test`
WHERE date >= '2016-03-29' AND date <= '2016-04-25'
GROUP BY week_number;

-- 2. Day of the week trend--
SELECT DAYNAME(date) as day_of_week, AVG(demand) as avg_daily_sales
FROM walmart.`m5 sampled test`
WHERE date >= '2016-03-29' AND date <= '2016-04-25'
GROUP BY day_of_week
ORDER BY FIELD(day_of_week, 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');

-- Unique Customers Analysis--
-- 1. Unique customers per day--
SELECT date, COUNT(DISTINCT id) as unique_customers
FROM walmart.`m5 sampled test`
WHERE date >= '2016-03-29' AND date <= '2016-04-25'
GROUP BY date;