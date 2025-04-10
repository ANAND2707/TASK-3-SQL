USE ecommerce;

-- Index on brand_name
CREATE INDEX idx_brand_name ON products(brand_name);

-- Index on discount_percent
CREATE INDEX idx_discount_percent ON products(discount_percent);

-- Index on rating
CREATE INDEX idx_rating ON products(rating);

-- Index on discounted_price
CREATE INDEX idx_discounted_price ON products(discounted_price);

-- Composite index on brand_name and rating
CREATE INDEX idx_brand_rating ON products(brand_name, rating);

-- View existing indexes
SHOW INDEXES FROM products;

