USE ecommerce;

-- Total number of products
SELECT COUNT(*) AS total_products FROM products;

-- Total marked price value of all products
SELECT SUM(marked_price) AS total_inventory_value FROM products;

-- Average discount percent
SELECT AVG(discount_percent) AS avg_discount FROM products;

-- Maximum and minimum product rating
SELECT MAX(rating) AS max_rating, MIN(rating) AS min_rating FROM products;

-- Count of products for each brand
SELECT brand_name, COUNT(*) AS total_products FROM products
GROUP BY brand_name
ORDER BY total_products DESC;

-- Average rating per brand
SELECT brand_name, AVG(rating) AS average_rating FROM products
GROUP BY brand_name
ORDER BY average_rating DESC;

-- Total discount amount by brand
SELECT brand_name, SUM(discount_amount) AS total_discount_given FROM products
GROUP BY brand_name
ORDER BY total_discount_given DESC;

-- Average discounted price per brand
SELECT brand_name, AVG(discounted_price) AS avg_discounted_price FROM products
GROUP BY brand_name
ORDER BY avg_discounted_price ASC;

-- Highest and lowest marked price per brand
SELECT brand_name, MAX(marked_price) AS highest_price, MIN(marked_price) AS lowest_price
FROM products
GROUP BY brand_name;

-- Total number of products per size
SELECT sizes, COUNT(*) AS total_by_size FROM products
GROUP BY sizes
ORDER BY total_by_size DESC;

-- Brand with the highest total rating (weighted)
SELECT brand_name, SUM(rating * rating_count) AS total_rating_score FROM products
GROUP BY brand_name
ORDER BY total_rating_score DESC;

-- Average discount percent per brand_tag
SELECT brand_tag, AVG(discount_percent) AS avg_discount FROM products
GROUP BY brand_tag
ORDER BY avg_discount DESC;
