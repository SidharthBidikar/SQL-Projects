# 🌱 Carbon Emissions by Industry (Product Carbon Footprints)

## Project Description

Greenhouse gas emissions attributable to products account for a significant portion of global emissions. This project analyzes product-level carbon footprint data to examine how emissions are distributed across industries.

The dataset contains product carbon footprints (PCFs) for various companies. PCFs represent the greenhouse gas emissions attributable to a product, measured in CO₂ equivalents.

The objective of this analysis is to determine how many companies operate in each industry group and calculate their total carbon footprint for the most recent year in the dataset.

---

## Dataset Overview

**Table Name:** `product_emissions`

### Granularity
1 row = 1 product for 1 company in 1 specific year

### Relevant Columns

- `year` — Reporting year  
- `product_name` — Name of the product  
- `company` — Company name  
- `country` — Country of company  
- `industry_group` — Industry classification  
- `carbon_footprint_pcf` — Product carbon footprint  

---

## Business Objective

Using the `product_emissions` table:

- Find the number of unique companies per industry group  
- Calculate total carbon footprint per industry group  
- Filter for the most recent year in the dataset  
- Round total footprint to one decimal place  
- Sort results from highest to lowest total footprint  

---

## SQL Analysis

```sql
SELECT
    industry_group,
    COUNT(DISTINCT company) AS num_companies,
    ROUND(SUM(carbon_footprint_pcf), 1) AS total_industry_footprint
FROM product_emissions
WHERE year = (
    SELECT MAX(year)
    FROM product_emissions
)
GROUP BY industry_group
ORDER BY total_industry_footprint DESC;
```

---

## SQL Concepts Demonstrated

- Subqueries
- `MAX()` aggregation
- Filtering with `WHERE`
- `COUNT(DISTINCT)`
- `SUM()`
- `ROUND()`
- `GROUP BY`
- `ORDER BY`

---

## Key Insight

By filtering to the most recent reporting year, this query ensures that industry comparisons are current and consistent. Aggregating emissions at the industry level provides a macro-level view of which sectors contribute the most to product-level carbon footprints.

---

## Folder Structure

```
SQL_mini_projects/
└── carbon-emissions-by-industry/
    └── README.md
```

