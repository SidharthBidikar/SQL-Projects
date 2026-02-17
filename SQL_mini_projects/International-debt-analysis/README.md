# International Debt Analysis (World Bank Data)

## 📌 Project Overview

Countries often borrow funds to support economic development, infrastructure, and social programs. This SQL mini project analyzes international debt data collected by the World Bank to explore patterns across developing countries.

The goal is to answer key analytical questions using SQL queries and aggregation techniques.

---

## 🎯 Business Questions

1. How many distinct countries are present in the database?
2. Which country has the highest total debt?
3. Which country has the lowest principal repayments?

---

## 🧩 Dataset Description

**Table:** `international_debt`

### Granularity
Each row represents:
- A specific debt indicator
- For a specific country

### Columns Used

- `country_name` → Name of country
- `country_code` → Country identifier
- `indicator_name` → Description of debt indicator
- `indicator_code` → Code of debt indicator
- `debt` → Value of debt (in current USD)

---

## 🛠 SQL Skills Demonstrated

- `COUNT(DISTINCT)`
- `SUM()` aggregation
- `GROUP BY`
- `ORDER BY`
- Filtering with `WHERE`
- Limiting results with `LIMIT`
- Column aliasing
- Analytical problem solving

---

## 🧮 Key Queries

### 1️⃣ Number of Distinct Countries

```sql
SELECT 
    COUNT(DISTINCT country_code) AS total_distinct_countries
FROM public.international_debt;
