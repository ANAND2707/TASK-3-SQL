USE ecommerce;

-- 1. Products priced above average
SELECT product_name, marked_price FROM products
WHERE marked_price > (
  SELECT AVG(marked_price) FROM products
);

-- 2. Products with discount more than average
SELECT product_name, discount_percent FROM products
WHERE discount_percent > (
  SELECT AVG(discount_percent) FROM products
);

-- 3. Products rated higher than their brand average
SELECT product_name, brand_name, rating FROM products p
WHERE rating > (
  SELECT AVG(rating) FROM products WHERE brand_name = p.brand_name
);

-- 4. Products from top 5 discounted brands (manual IN list or CTE)
SELECT product_name, brand_name, discount_percent FROM products
WHERE brand_name IN ('HRX', 'ONLY', 'Puma', 'Roadster', 'Adidas');

-- 5. Brands with highest average marked price
SELECT brand_name FROM products
GROUP BY brand_name
HAVING AVG(marked_price) = (
  SELECT MAX(avg_price) FROM (
    SELECT brand_name, AVG(marked_price) AS avg_price
    FROM products GROUP BY brand_name
  ) AS temp
);

-- 6. Products from brands with >100 products
SELECT product_name, brand_name FROM products
WHERE brand_name IN (
  SELECT brand_name FROM products
  GROUP BY brand_name HAVING COUNT(*) > 100
);

-- 7. Products with max discount amount
SELECT product_name, discount_amount FROM products
WHERE discount_amount = (
  SELECT MAX(discount_amount) FROM products
);

-- 8. Products from brands rated above 4
SELECT product_name, brand_name, rating FROM products
WHERE brand_name IN (
  SELECT brand_name FROM products
  GROUP BY brand_name HAVING AVG(rating) > 4
);

-- 9. Brands with >5 products priced < ₹200
SELECT DISTINCT brand_name FROM products
WHERE brand_name IN (
  SELECT brand_name FROM products
  WHERE marked_price < 200
  GROUP BY brand_name HAVING COUNT(*) > 5
);

-- 10. Products cheaper than their brand average discounted price
SELECT product_name, brand_name, discounted_price FROM products p
WHERE discounted_price < (
  SELECT AVG(discounted_price) FROM products
  WHERE brand_name = p.brand_name
);
