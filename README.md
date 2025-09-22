# Zepto-SQL-data-analysis-project
This is a complete, real-world data analyst portfolio project based on an e-commerce inventory dataset scraped from Zepto — one of India’s fastest-growing quick-commerce startups. This project simulates real analyst workflows, from raw data exploration to business-focused data analysis.
Here’s a professional **README.md** you can use for your GitHub repository of the **Zepto SQL Project**:

````markdown
# 🛒 Zepto SQL Project

This project is a **SQL-based analysis and data cleaning project** using a dataset inspired by **Zepto** (an online grocery delivery platform).  
The project demonstrates the creation of a database, data cleaning, and the derivation of business insights using SQL queries.

---

## 📂 Project Structure
- **Database Creation** → Creating `Zepto_db` and the `zepto` table.  
- **Data Exploration** → Checking row counts, distinct categories, null values, duplicates.  
- **Data Cleaning** → Handling missing values, removing invalid records, unit conversion (paise → rupees).  
- **Business Insights** → Answering analytical questions to generate actionable insights.

---

## 🏗️ Database Schema
**Table: `zepto`**
| Column                | Type           | Description                              |
|------------------------|----------------|------------------------------------------|
| sku_id                | INT (PK)       | Unique product identifier                 |
| category              | VARCHAR(120)   | Product category                          |
| name                  | VARCHAR(150)   | Product name                              |
| mrp                   | DECIMAL(8,2)   | Maximum Retail Price (₹)                  |
| discountPercent       | DECIMAL(5,2)   | Discount percentage                       |
| availableQuantity     | INT            | Quantity available in stock               |
| discountedSellingPrice| DECIMAL(8,2)   | Final selling price after discount        |
| weightInGms           | INT            | Product weight in grams                   |
| outOfStock            | BOOLEAN        | Availability status                       |
| quantity              | INT            | Quantity ordered                          |

---

## 🔍 Data Analysis & Insights
The project answers key business questions such as:

1. **Top 10 best-value products based on discounts.**  
2. **Products with high MRP but out of stock.**  
3. **Estimated revenue by category.**  
4. **Products with MRP > ₹500 and discount < 10%.**  
5. **Top 5 categories with the highest average discounts.**  
6. **Best value products (Price per gram).**  
7. **Categorizing products into Low, Medium, Bulk.**  
8. **Total inventory weight per category.**  
9. **Products with the largest price difference (MRP vs Discounted Price).**  
10. **Top 5 products occupying maximum shelf space.**

---

## ⚙️ Setup & Execution
1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/zepto-sql-project.git
````

2. Import the SQL file (`ZEPTO PROJECT.sql`) into **MySQL Workbench** or any SQL client.
3. Run the queries step by step to:

   * Create the database and tables
   * Explore & clean data
   * Generate insights

---

## 📊 Skills & Concepts Used

* SQL DDL & DML (Create, Insert, Update, Delete)
* Data Cleaning (Removing invalid data, handling nulls, unit conversion)
* Aggregations (`SUM`, `AVG`, `ROUND`)
* Grouping & Categorization (`CASE`, `GROUP BY`)
* Business Insights using SQL

---

## 🚀 Future Improvements

* Add **visualizations** using Power BI or Tableau.
* Create **stored procedures & functions** for automation.
* Integrate with **Python (Pandas + SQLAlchemy)** for advanced analysis.


Would you like me to also create a **shorter student-friendly README** (highlights + queries), or do you prefer this **detailed professional version** for recruiters?
```
