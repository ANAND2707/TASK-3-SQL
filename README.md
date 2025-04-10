# 📊 Task 3 – SQL for Data Analysis

This task is part of the Elevate Labs Internship. We analyzed an e-commerce product dataset using MySQL, covering all the key SQL concepts for data analysis, including filtering, aggregation, joins, views, subqueries, and performance optimization.

---

## 🗂️ Folder Structure

TASK-3-SQL-DATA-ANALYSIS/<br>
├── database/<br>
│   └── data.csv                         <-- Raw dataset<br>
├── A_SELECT_WHERE_ORDERBY_GROUPBY.sql  <-- Basic filtering, sorting, grouping<br>
├── B_JOINS.sql                          <-- INNER, LEFT, RIGHT joins<br>
├── C_SUBQUERIES.sql                     <-- Scalar, correlated, IN, HAVING<br>
├── D_AGGREGATE_FUNCTIONS.sql            <-- SUM, AVG, COUNT, MAX, MIN<br>
├── E_VIEWS.sql                          <-- Reusable views for analysis<br>
├── F_INDEX_OPTIMIZATION.sql             <-- Performance tuning using indexes<br>
├── README.md                            <-- Full explanation of the work<br>
└── screenshots/<br>
    ├── a/   <-- Screenshots for SELECT, WHERE, ORDER BY, GROUP BY<br>
    ├── b/   <-- Screenshots for JOINS<br>
    ├── c/   <-- Screenshots for Subqueries<br>
    ├── d/   <-- Screenshots for Aggregates<br>
    ├── e/   <-- Screenshots for Views<br>
    └── f/   <-- Screenshots for Index Optimization<br>


---

## ✅ Breakdown of Work

### 🔹 A. SELECT, WHERE, ORDER BY, GROUP BY
We used basic SQL to:
- Filter products by rating, price, and size
- Group data by brand, tag, and size
- Sort results by discount, popularity, and pricing
- Analyze high-value, highly-rated products

🔍 *Insights*: Identified top brands by product count, top discounted products, and the price range that dominates the catalog.

---

### 🔹 B. JOINS (INNER, LEFT, RIGHT)
We created a secondary `brand_info` table manually using real-world brand data like:
- Origin country
- Year founded

Then we:
- Used `INNER JOIN` to link with the main dataset
- Used `LEFT` and `RIGHT JOIN` to explore brand-product relationships
- Grouped by brand to find product counts and details

---

### 🔹 C. Subqueries
We used subqueries to answer deep analytical questions:
- Brands with discount above average
- Products above brand’s average rating
- Brands with max-priced items
- Subquery inside `HAVING`, `IN`, and correlated WHERE conditions

---

### 🔹 D. Aggregate Functions (SUM, AVG, COUNT, MIN, MAX)
We used:
- `AVG()` for rating, pricing, and discount analysis
- `SUM()` for total discount given by brands
- `COUNT()` for brand-wise and size-wise product counts
- `MAX()` and `MIN()` for rating and price extremes

---

### 🔹 E. Views for Analysis

We created analytical **views** for reusable dashboards and decision-making:

- `top_discounted_products`: Top 10 discounts
- `top_rated_brands`: Brands with avg rating ≥ 4
- `affordable_quality_products`: Products < ₹500 with rating > 4
- `brand_summary`: Brand-wise aggregation
- `size_distribution`: Size category popularity

---

## 💡 Analytical Thinking & Real-World Questions (from Part E)

We approached the dataset by asking:

### 1️⃣ **Are expensive products better rated? And do they get good discounts?**
> We grouped by brand to calculate:
> - Avg price
> - Avg rating
> - Avg discount
> Result: Found that higher-priced brands don’t always offer high discounts, but some do maintain high ratings.

### 2️⃣ **Do customers prefer cheaper or expensive products?**
> Grouped by price range (Low, Medium, High) and counted number of products.
> Result: Most products (and likely sales) fall into the **medium to low** range.

### 3️⃣ **Is there any brand that is both popular and value-for-money?**
> Criteria:
> - Has large product collection (COUNT > 50)
> - Rating ≥ 4
> - Avg discount ≥ dataset’s average
> - Avg price < ₹1000
> Result: Found certain brands that met all the criteria — good for both customers and marketing!

---

### 🔹 F. Index Optimization

We created indexes to speed up filtering and joins:

```sql
CREATE INDEX idx_brand_name ON products(brand_name);
CREATE INDEX idx_discount_percent ON products(discount_percent);
CREATE INDEX idx_rating ON products(rating);
CREATE INDEX idx_discounted_price ON products(discounted_price);
CREATE INDEX idx_brand_rating ON products(brand_name, rating);

