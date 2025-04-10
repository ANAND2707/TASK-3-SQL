USE ecommerce;

-- View: Top 10 Most Discounted Products
CREATE VIEW top_discounted_products AS
SELECT product_name, brand_name, marked_price, discounted_price, discount_percent
FROM products
ORDER BY discount_percent DESC
LIMIT 10;

-- View: Brands with Highest Average Rating
CREATE VIEW top_rated_brands AS
SELECT brand_name, AVG(rating) AS avg_rating FROM products
GROUP BY brand_name
HAVING avg_rating >= 4
ORDER BY avg_rating DESC;

-- View: Affordable & Well-Rated Products
CREATE VIEW affordable_quality_products AS
SELECT product_name, brand_name, discounted_price, rating FROM products
WHERE discounted_price < 500 AND rating >= 4;

-- View: Brand Summary - pricing, rating, discount
CREATE VIEW brand_summary AS
SELECT brand_name,
       COUNT(*) AS total_products,
       AVG(marked_price) AS avg_price,
       AVG(rating) AS avg_rating,
       AVG(discount_percent) AS avg_discount
FROM products
GROUP BY brand_name;

-- View: Sizes Popularity
CREATE VIEW size_distribution AS
SELECT sizes, COUNT(*) AS product_count FROM products
GROUP BY sizes
ORDER BY product_count DESC;



USE ecommerce;

-- 1️⃣ QUESTION: Do expensive products get higher ratings? And do they offer good discounts?

-- Get average price, rating, and discount for each brand
SELECT brand_name, 
       AVG(marked_price) AS avg_price, 
       AVG(rating) AS avg_rating, 
       AVG(discount_percent) AS avg_discount
FROM products
GROUP BY brand_name
ORDER BY avg_price DESC;

-- 💡 Insight: This shows if expensive brands also maintain high ratings or give good discounts.
-- Helps evaluate whether high price equals high quality or better offers.

-- -------------------------------------------------------

-- 2️⃣ QUESTION: Do customers prefer cheaper or expensive products more?

-- Categorize products by price range
SELECT
  CASE 
    WHEN discounted_price < 500 THEN 'Low'
    WHEN discounted_price BETWEEN 500 AND 1500 THEN 'Medium'
    ELSE 'High'
  END AS price_range,
  COUNT(*) AS product_count
FROM products
GROUP BY price_range
ORDER BY product_count DESC;

-- 💡 Insight: Reveals what price range dominates the catalog.
-- High count in a price band likely means more sales or customer focus in that tier.

-- -------------------------------------------------------

-- 3️⃣ QUESTION: Is there any brand that is popular, affordable, well-rated, and gives high discounts?

-- Step 1: Get overall average discount
SELECT AVG(discount_percent) AS avg_discount FROM products;

-- 💡 Example result: ~25%. Use this to set a threshold in the next query.

-- Step 2: Find brands with:
-- > 50 products, rating ≥ 4, discount ≥ 25%, price < 1000

SELECT brand_name,
       COUNT(*) AS total_products,
       AVG(marked_price) AS avg_price,
       AVG(rating) AS avg_rating,
       AVG(discount_percent) AS avg_discount
FROM products
GROUP BY brand_name
HAVING COUNT(*) > 50
   AND AVG(rating) >= 4
   AND AVG(discount_percent) >= 25
   AND AVG(marked_price) < 1000
ORDER BY total_products DESC;

-- 💡 Insight: These are the most balanced, budget-friendly, and trustworthy brands.
-- Ideal for customer recommendations, offers, and marketing promotions.
