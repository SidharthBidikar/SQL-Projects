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

## 🎯 Project Objectives & SQL Solutions

---

## 1️⃣ Oldest Business on Each Continent

### Objective
Identify the oldest business on each continent by joining country and business data and selecting the minimum founding year per continent.

### SQL Query

```sql
SELECT
    c.continent,
    c.country,
    b.business,
    b.year_founded
FROM countries AS c
INNER JOIN businesses AS b
    ON b.country_code = c.country_code
INNER JOIN (
    SELECT
        c.continent,
        MIN(b.year_founded) AS year_founded
    FROM countries AS c
    INNER JOIN businesses AS b
        ON b.country_code = c.country_code
    GROUP BY c.continent
) AS oldest
    ON c.continent = oldest.continent
    AND b.year_founded = oldest.year_founded;
```
<img width="950" height="689" alt="image" src="https://github.com/user-attachments/assets/43298918-58a6-4b81-bda0-17b68b63ed0e" />
---

## 2️⃣ Countries Missing Oldest Business Data

### Objective
Count how many countries per continent do not have oldest business records. Include both `businesses` and `new_businesses` tables.

### SQL Query

```sql
SELECT
    c.continent,
    COUNT(*) AS countries_without_businesses
FROM countries AS c
LEFT JOIN (
    SELECT *
    FROM businesses
    UNION
    SELECT *
    FROM new_businesses
) AS all_businesses
    ON c.country_code = all_businesses.country_code
WHERE all_businesses.country_code IS NULL
GROUP BY c.continent;
```

---

## 3️⃣ Oldest Business by Continent and Category

### Objective
Determine which business categories last the longest by finding the earliest founding year for each continent and category combination.

### SQL Query

```sql
SELECT
    c1.continent,
    c2.category,
    MIN(b.year_founded) AS year_founded
FROM countries AS c1
INNER JOIN businesses AS b
    ON c1.country_code = b.country_code
INNER JOIN categories AS c2
    ON c2.category_code = b.category_code
GROUP BY c1.continent, c2.category
ORDER BY c1.continent, year_founded;
```

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
