# 🌍 International Debt Analysis (World Bank Data)

## Project Description

Humans not only take debts to manage necessities. A country may also take debt to manage its economy. Infrastructure spending is one costly ingredient required for a country’s citizens to lead comfortable lives. The World Bank provides debt to countries for economic development.

In this project, we analyze international debt data collected by The World Bank. The dataset contains information about the amount of debt (in USD) owed by developing countries across several categories.

The objective is to answer the following three analytical questions using SQL.

---

## Dataset Overview

**Table Name:** `international_debt`

### Granularity
1 row = 1 country × 1 debt indicator

### Columns

- `country_name` — Name of the country  
- `country_code` — Code representing the country  
- `indicator_name` — Description of the debt indicator  
- `indicator_code` — Code representing the debt indicator  
- `debt` — Value of the debt indicator (current US dollars)

---

## SQL Analysis

### 1️⃣ Number of Distinct Countries

Return a single row and column aliased as `total_distinct_countries`.

```sql
SELECT 
    COUNT(DISTINCT country_code) AS total_distinct_countries
FROM public.international_debt;
```

---

### 2️⃣ Country with the Highest Total Debt

Return two columns: `country_name` and `total_debt`, limited to one row.

```sql
SELECT 
    country_name,
    SUM(debt) AS total_debt
FROM public.international_debt
GROUP BY country_name
ORDER BY total_debt DESC
LIMIT 1;
```

---

### 3️⃣ Country with the Lowest Principal Repayment

Principal repayment indicator code: `DT.AMT.DLXF.CD`

Return three columns: `country_name`, `indicator_name`, and `lowest_repayment`, limited to one row.

```sql
SELECT 
    country_name,
    indicator_name,
    debt AS lowest_repayment
FROM public.international_debt
WHERE indicator_code = 'DT.AMT.DLXF.CD'
ORDER BY debt ASC
LIMIT 1;
```

---

## SQL Concepts Demonstrated

- `COUNT(DISTINCT)`
- `SUM()` aggregation
- `GROUP BY`
- `ORDER BY`
- Filtering using `WHERE`
- `LIMIT`
- Column aliasing

---

## Folder Structure

```
SQL_mini_projects/
└── international-debt-analysis/
    └── README.md
```
