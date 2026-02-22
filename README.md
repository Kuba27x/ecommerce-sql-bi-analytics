# 🛒 TechStore E-Commerce Analytics: End-to-End SQL & BI Project

![MySQL](https://img.shields.io/badge/MySQL-00000F?style=for-the-badge&logo=mysql&logoColor=white)
![Looker Studio](https://img.shields.io/badge/Looker_Studio-4285F4?style=for-the-badge&logo=google&logoColor=white)
![Data Analysis](https://img.shields.io/badge/Data_Analysis-1081c2?style=for-the-badge)

## 📌 Project Overview
This project demonstrates a complete end-to-end data analytics workflow for a fictional e-commerce company, **TechStore**. The goal was to transform raw, messy relational database records into actionable business insights. 

The project covers the entire data pipeline: from designing the database schema and cleaning text data, through writing complex analytical SQL queries, to building an interactive Business Intelligence dashboard.

👉 **[Click here to view the Interactive Dashboard in Google Looker Studio](https://lookerstudio.google.com/reporting/de8fc886-ffb0-45f4-b543-1f10bd5f9f0b)** 📊

---

## 🛠️ Tech Stack & Skills Showcased
* **Database:** MySQL
* **Data Visualization:** Google Looker Studio
* **SQL Skills:** Common Table Expressions (CTEs), Window Functions (`LAG`, `DENSE_RANK`), Data Cleaning (`COALESCE`, String manipulation), Aggregations, Complex `JOIN`s.

---

## 💡 Business Problems Solved

I formulated and answered key business questions using SQL to drive strategic decisions:

1. **Demographics & Data Quality:** *Where do our customers come from?* * Cleaned inconsistent string formats (whitespaces, varying cases) and handled missing `NULL` values in customer addresses to ensure accurate demographic mapping.
2. **Revenue Trends (MoM):** *Is our sales performance improving?*
   * Utilized the `LAG()` window function to calculate Month-over-Month (MoM) revenue growth and visualize the financial trajectory.
3. **Customer Segmentation (VIPs):** *Who are our most valuable customers?* * Aggregated total spending and order frequency per user, actively filtering out cancelled orders to create a reliable VIP leaderboard for marketing campaigns.
4. **Product Performance:** *What is the absolute best-selling product in each category?* * Solved the classic "Top N per group" problem using `DENSE_RANK()` to feed the marketing team with accurate bestseller data.

---

## 💻 SQL Code Showcase

Here is a snippet of the SQL code used to identify the top-selling product in each category using Window Functions. *(The full suite of scripts can be found in the `sql_scripts` folder).*

```sql
WITH stats AS (
    SELECT 
        oi.product_id,
        SUM(oi.quantity) AS number_sold
    FROM order_items oi
    JOIN orders o ON oi.order_id = o.order_id
        AND o.status != 'cancelled'
    GROUP BY oi.product_id
),
ranking AS (
    SELECT 
        p.category,
        p.product_name,
        s.number_sold,
        DENSE_RANK() OVER(PARTITION BY p.category ORDER BY s.number_sold DESC) AS rnk
    FROM stats s
    JOIN products p ON s.product_id = p.product_id
)
SELECT category, product_name, number_sold
FROM ranking
WHERE rnk = 1;
```

---

## 📁 Repository Structure

* sql_scripts/
  - create_db.sql, create_tables_insert_data.sql - DDL statements and raw data insertion.
  - clean_customers.sql - View created to clean and standardize data.
  - monthly_revenue.sql, vip_customers.sql, top_products_per_category.sql - Advanced queries (CTEs, Window Functions) answering business questions.
* csv_files/
  - Csv files.
* README.md - Project documentation and findings.
