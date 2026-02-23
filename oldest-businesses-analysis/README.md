# 🌍 SQL Mini Project: The World's Oldest Businesses

## Project Description

An essential part of business strategy is long-term survival — adapting to economic shifts, technological disruption, wars, policy changes, and evolving consumer behavior.

In this project, we analyze historical business data compiled by BusinessFinancing.co.uk to understand what allows certain businesses to survive for centuries.

Using SQL joins, aggregations, subqueries, and data manipulation techniques, we explore patterns across continents, countries, and industries to uncover insights about business longevity.

---

## 📂 Dataset Overview

The data consists of four main tables:

### 1️⃣ `businesses`
| Column | Description |
|---------|-------------|
| business | Name of the business |
| year_founded | Year the business was established |
| category_code | Code representing the business category |
| country_code | ISO 3166-1 three-letter country code |

### 2️⃣ `new_businesses`
Same structure as `businesses`, containing additional records.

### 3️⃣ `countries`
| Column | Description |
|---------|-------------|
| country_code | ISO 3166-1 three-letter country code |
| country | Name of the country |
| continent | Continent where the country is located |

### 4️⃣ `categories`
| Column | Description |
|---------|-------------|
| category_code | Code for the business category |
| category | Description of the business category |

---

## 🎯 Project Objectives

### 1️⃣ Identify the Oldest Business on Each Continent

- Join `businesses` with `countries`
- Determine the minimum founding year per continent
- Return:
  - `continent`
  - `country`
  - `business`
  - `year_founded`

This reveals which businesses have survived the longest within each continent.

---

### 2️⃣ Analyze Missing Data by Continent

- Identify how many countries per continent lack oldest business data
- Include records from both `businesses` and `new_businesses`
- Count countries without business records

Return:
  - `continent`
  - `countries_without_businesses`

This helps assess dataset completeness and coverage.

---

### 3️⃣ Determine Which Business Categories Last the Longest

- Join `businesses`, `countries`, and `categories`
- For each continent and category combination:
  - Identify the oldest founding year

Return:
  - `continent`
  - `category`
  - `year_founded`

This helps uncover which industries tend to endure over centuries.

---

## 🛠 Skills Practiced

- INNER JOIN & LEFT JOIN
- UNION
- GROUP BY with aggregation
- Subqueries
- Data completeness analysis
- Multi-table relational analysis

---

## 📊 Key Learning Outcome

This project demonstrates how relational data modeling and SQL aggregation techniques can reveal strategic insights about business longevity, industry resilience, and geographic patterns in long-term survival.

Understanding why some businesses endure for centuries provides valuable perspective on sustainability, adaptability, and structural advantages across industries.

---

## 🚀 Tools Used

- PostgreSQL
- SQL
- DataFrame outputs for structured analysis
- GitHub for documentation

---

This project strengthens real-world SQL problem-solving skills by combining business thinking with structured data analysis.
