USE ecommerce;

-- 1. INNER JOIN – Products and their brand origin
SELECT p.product_name, p.brand_name, b.origin_country
FROM products p
INNER JOIN brand_info b ON p.brand_name = b.brand_name;

-- 2. LEFT JOIN – All products, show brand info if available
SELECT p.product_name, p.brand_name, b.origin_country
FROM products p
LEFT JOIN brand_info b ON p.brand_name = b.brand_name;

-- 3. RIGHT JOIN – All brand info, show product if exists
SELECT b.brand_name, b.origin_country, p.product_name
FROM brand_info b
RIGHT JOIN products p ON p.brand_name = b.brand_name;

-- 4. Number of products for each known brand with origin country
SELECT b.brand_name, b.origin_country, COUNT(p.product_name) AS total_products
FROM brand_info b
LEFT JOIN products p ON p.brand_name = b.brand_name
GROUP BY b.brand_name, b.origin_country;
