USE ecommerce;

-- 1. All product names with their brands
SELECT product_name, brand_name FROM products;

-- 2. Products with rating > 4.5
SELECT product_name, rating FROM products
WHERE rating > 4.5
ORDER BY rating DESC;

-- 3. Products with marked price over 2000
SELECT product_name, marked_price FROM products
WHERE marked_price > 2000
ORDER BY marked_price DESC;

-- 4. Top 10 most discounted products
SELECT product_name, discount_percent FROM products
ORDER BY discount_percent DESC
LIMIT 10;

-- 5. Products with high rating and low price
SELECT product_name, rating, discounted_price FROM products
WHERE rating > 4.5 AND discounted_price < 1000
ORDER BY rating DESC, discounted_price ASC;

-- 6. Count of products per brand
SELECT brand_name, COUNT(*) AS total_products FROM products
GROUP BY brand_name
ORDER BY total_products DESC;

-- 7. Count of products by size
SELECT sizes, COUNT(*) AS size_count FROM products
GROUP BY sizes
ORDER BY size_count DESC;

-- 8. Count of products by product tag
SELECT product_tag, COUNT(*) AS tag_count FROM products
GROUP BY product_tag
ORDER BY tag_count DESC;

-- 9. Count of products by brand tag
SELECT brand_tag, COUNT(*) AS tag_count FROM products
GROUP BY brand_tag
ORDER BY tag_count DESC;

-- 10. Products with 0 ratings
SELECT product_name, rating FROM products
WHERE rating = 0;

-- 11. Products with rating between 3 and 4
SELECT product_name, rating FROM products
WHERE rating BETWEEN 3 AND 4
ORDER BY rating DESC;

-- 12. Products with discount > ₹500
SELECT product_name, discount_amount FROM products
WHERE discount_amount > 500
ORDER BY discount_amount DESC;

-- 13. Products grouped by rating
SELECT rating, COUNT(*) AS count_by_rating FROM products
GROUP BY rating
ORDER BY rating DESC;

-- 14. Average marked price per brand
SELECT brand_name, AVG(marked_price) AS avg_price FROM products
GROUP BY brand_name
ORDER BY avg_price DESC;

-- 15. Brands with discount above 20%
SELECT brand_name, AVG(discount_percent) AS avg_discount FROM products
GROUP BY brand_name
HAVING AVG(discount_percent) > 20
ORDER BY avg_discount DESC;

-- 16. Max price per brand
SELECT brand_name, MAX(marked_price) AS max_price FROM products
GROUP BY brand_name
ORDER BY max_price DESC;

-- 17. Min discounted price per size
SELECT sizes, MIN(discounted_price) AS min_price FROM products
GROUP BY sizes
ORDER BY min_price ASC;

-- 18. Products with no discount
SELECT COUNT(*) AS no_discount_products FROM products
WHERE marked_price = discounted_price;

-- 19. Top 5 sizes with most products
SELECT sizes, COUNT(*) AS count_size FROM products
GROUP BY sizes
ORDER BY count_size DESC
LIMIT 5;

-- 20. Average rating by product tag
SELECT product_tag, AVG(rating) AS avg_rating FROM products
GROUP BY product_tag
ORDER BY avg_rating DESC;
