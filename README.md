# 🛒 Blinkit Sales Analysis | SQL

## 📌 Project Overview

Blinkit is one of India's fastest-growing quick commerce platforms, delivering groceries and daily essentials within minutes. This project analyzes **8,500+ sales transactions** from Blinkit outlets using SQL to uncover revenue patterns, top-performing products, and outlet-level insights.

---

## 🎯 Objective

To help Blinkit's business team understand what sells, where it sells, and how to optimize outlet performance using data-driven insights.

---

## 🗂️ Dataset

| Detail | Info |
|--------|------|
| **File** | `blinkit_sales_dataset.csv` |
| **Rows** | 8,524 transactions |
| **Domain** | Retail / Quick Commerce |

---

## 🧹 Data Cleaning

The `Item_Fat_Content` column had inconsistent labels ('low fat', 'LF', 'reg') which were standardized to **'Low Fat'** and **'Regular'** using an UPDATE + CASE statement in SQL.

---

## 📊 Key KPIs

| Metric | Value |
|--------|-------|
| 💰 Total Sales | ₹1.20 Million |
| 💵 Average Sales | ₹140.99 per transaction |
| 📦 Total Transactions | 8,524 |
| ⭐ Average Rating | 4.0 / 5 |

---

## 🔍 Key Findings

| # | Finding |
|---|---------|
| 1 | Low Fat products generate higher sales (₹7.76L) vs Regular (₹4.25L) |
| 2 | Fruits & Vegetables is the top-selling category at ₹1.78 Lakhs |
| 3 | Tier 3 outlets dominate sales across all product types (₹4.72 Lakhs) |
| 4 | Medium-sized outlets contribute the most — 42.27% of total sales |
| 5 | Supermarket Type1 is the highest-performing outlet type at ₹7.88 Lakhs |
| 6 | Outlets established in 1998 generate the highest historical sales |

---

## 💡 Business Recommendations

1. **Expand Tier 3 presence** — highest sales across all categories
2. **Focus on Medium outlets** — best revenue contribution
3. **Promote Low Fat products** — clear customer preference
4. **Invest in Supermarket Type1** — outperforms all other outlet formats
5. **Stock more Fruits & Vegetables** — top revenue-driving category

---

## 📁 Files in This Repository

| File | Description |
|------|-------------|
| `blinkit_sales_analysis.sql` | All SQL queries with comments and insights |
| `blinkit_sales_dataset.csv` | Raw sales dataset |
| `blinkit_sales_report.docx` | Detailed project report |

---

## 🛠️ Tools Used

MySQL · SQL Aggregations · CASE Statements · Subqueries · CONCAT · ROUND · IFNULL

---

## 👩‍💻 Author

**Masira Siddiqui**
BSc Computer Science | University of Mumbai, 2026
📍 Mumbai, India
🔗 [LinkedIn](https://www.linkedin.com/in/masirasiddiqui)

---

*This project was completed as part of self-learning in Data Analytics.*
