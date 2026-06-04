# Black Friday Retail Sales Analysis using SQL

## 📌 Project Overview

This project explores customer purchasing behavior, product performance, revenue generation, and discount effectiveness using a Black Friday retail sales dataset. The analysis was conducted entirely in SQL, with a focus on applying real-world analytical techniques such as aggregations, Common Table Expressions (CTEs), joins, and window functions.

The goal of this project is to uncover actionable business insights that can help retailers understand customer behavior, optimize promotions, and identify high-value customer segments.



## 📊 Dataset

The dataset contains approximately 100,000 retail transactions and includes customer demographics, purchasing information, discounts, payment methods, and transaction timestamps.

### Key Features

| Column           | Description                                    |
| ---------------- | ---------------------------------------------- |
| transaction_id   | Unique transaction identifier                  |
| customer_id      | Unique customer identifier                     |
| age_group        | Customer age bracket                           |
| gender           | Customer gender                                |
| city             | Customer location                              |
| customer_segment | Customer category (New, Returning, Loyal, VIP) |
| product_id       | Product identifier                             |
| product_category | Product category                               |
| original_price   | Original product price                         |
| discount_pct     | Discount percentage applied                    |
| final_price      | Final purchase price                           |
| payment_method   | Payment method used                            |
| purchase_hour    | Hour of transaction                            |
| weekend          | Weekend purchase flag                          |
| black_friday     | Black Friday purchase flag                     |
| purchase_date    | Transaction date                               |

---

## 🎯 Business Questions Explored

### Customer Analysis

* Which customer segments generate the most revenue?
* Which age groups spend the most?
* How are high-spending customers distributed across customer segments?
* Do spending patterns differ across customer quartiles?

### Product Analysis

* Which product categories are the most popular?
* Which categories generate the highest revenue?
* Which categories contribute most to cumulative revenue?

### Time-Based Analysis

* Which time of day generates the highest revenue?
* When are customers most active?
* Which time periods offer the greatest customer savings?

### Payment Analysis

* What are the most commonly used payment methods?
* Which payment methods generate the highest revenue?
* How do payment preferences vary across customer segments?

### Discount Analysis

* Which discount ranges generate the highest revenue?
* Do larger discounts necessarily lead to higher sales?

---

## 🛠 SQL Concepts Used

### Aggregations

* SUM()
* AVG()
* COUNT()
* MIN()
* MAX()

### Window Functions

* NTILE()
* SUM() OVER()
* COUNT() OVER()
* Running Totals
* Revenue Contribution Analysis

### Common Table Expressions (CTEs)

* Customer segmentation
* Revenue contribution analysis
* Quartile-based spending analysis

### Joins

* Combining customer distribution and revenue distribution analyses
* Multi-step analytical workflows

---

## 📈 Key Insights

### Customer Behavior

* Participation in the Black Friday sale was distributed almost equally across all three gender groups.
* Customers aged **36–45** participated the most and generated the highest overall spending.
* **Returning customers** generated the highest revenue among all customer segments.
* * Surprisingly, VIP customers contributed the least revenue among all customer segments despite being classified as premium customers.
* * Revenue contribution and customer composition within spending quartiles were remarkably similar across customer segments.
* Returning customers consistently dominated every spending quartile.
* New customers represented approximately 30% of customers across most spending quartiles.

### Product Performance

* Accessories and Footwear were among the most frequently purchased categories.
* Electronics and Home & Kitchen generated the highest revenue, contributing over **$14M** and **$6M** respectively.
* Electronics and Home & Kitchen alone accounted for approximately the first **50% of total cumulative revenue**.
* Sports and Accessories helped drive cumulative revenue contribution to approximately **75%**.

### Discount Analysis

* Products discounted between **0% and 20%** generated the highest revenue, contributing nearly **$15M**.
* Moderate discounts appeared to outperform deeper discount levels in terms of total revenue generation.

### Time-Based Insights

* Morning and Late Night were the most popular shopping periods.
* Morning generated the highest number of transactions and the highest overall revenue.
* Customers collectively saved nearly **$3M** during morning purchases.
* Night-time sales underperformed compared to other periods, suggesting an opportunity for targeted promotions.

### Geographic Insights

* Seattle showed the highest concentration of high-spending customers.

### Payment Insights

* Mobile Wallet was the most frequently used payment method and generated the highest overall revenue.
* Payment preferences varied across customer segments:

  * Loyal Customers → PayPal
  * New Customers → Credit Card
  * Returning Customers → Debit Card
  * VIP Customers → Mobile Wallet

 ### Weekend & Black Friday Analysis

* Weekend purchases generated nearly **2× more revenue** than non-weekend purchases.
* Electronics dominated weekend sales, contributing approximately **42%** of total weekend revenue.
* Home & Kitchen was the second-highest revenue-generating category during weekends, contributing approximately **19%** of revenue.
* Black Friday purchasing patterns closely mirrored weekend behavior.
* Electronics and Home & Kitchen remained the leading categories during Black Friday, contributing approximately **40%** and **19%** of revenue respectively.

---

## 📚 Advanced SQL Techniques Implemented

### Revenue Contribution Analysis

Used cumulative revenue calculations and window functions to identify categories contributing to:

* First 50% of revenue
* First 75% of revenue
* First 90% of revenue

### Customer Spending Quartiles

Used `NTILE(4)` to segment customers based on total spending and analyze:

* Customer composition within quartiles
* Revenue distribution within quartiles
* Segment representation among high-value customers

### Time-Based Revenue Analysis

Created custom time buckets:

* Late Night
* Morning
* Afternoon
* Night

to compare purchasing behaviour and revenue generation.



## 🚀 Future Analysis

Planned extensions to the project include:

* Customer Decile Analysis using `NTILE(10)`
* Customer Lifetime Value (CLV) exploration
* Payment Method Revenue Contribution Analysis
* Product Category Performance by City
* Revenue Trend Analysis using transaction dates
* Moving Average and Growth Rate calculations using window functions
* Cohort Analysis of New vs Returning Customers
* Customer Retention and Purchase Frequency Analysis



## 💡 Key Learnings

Through this project, I strengthened my understanding of:

* SQL aggregations and analytical thinking
* Window functions and ranking techniques
* Revenue contribution and Pareto analysis
* Customer segmentation strategies
* Multi-CTE query design
* Translating SQL outputs into business insights



## 🏷 Technologies Used

* MySQL
* SQL Window Functions
* Common Table Expressions (CTEs)
* Git & GitHub

---

## 📬 Author

**Vitista Tyagi**

Data Science Graduate Student | SQL | Python | Machine Learning | GenAI

Currently building projects in analytics, machine learning, and data engineering while exploring real-world business problems through data.
