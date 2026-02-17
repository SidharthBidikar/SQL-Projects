# ⚡ EV Charging Behavior Analysis (SQL Mini Project)

## 📌 Project Overview

As Electric Vehicles (EVs) become more common, shared charging infrastructure in residential buildings is under increasing pressure. Apartment complexes are retrofitting garages with **shared charging stations** accessible to all residents.

This project analyzes EV charging session data using SQL to:

- Measure shared station usage per garage
- Identify peak charging start times
- Detect users with extended charging durations

The goal is to generate insights that help building managers optimize charger availability and resource allocation.

---

```
```

---

## 🛢 Dataset Description

The dataset is stored in a PostgreSQL table named:

### `charging_sessions`

| Column Name          | Data Type | Description |
|----------------------|----------|-------------|
| garage_id            | VARCHAR  | Identifier for the garage/building |
| user_id              | VARCHAR  | Unique identifier for the user |
| user_type            | VARCHAR  | Indicates whether the station is `Shared` or `Private` |
| start_plugin         | DATETIME | Charging session start timestamp |
| start_plugin_hour    | NUMERIC  | Hour (24-hour format) session started |
| end_plugout          | DATETIME | Charging session end timestamp |
| end_plugout_hour     | NUMERIC  | Hour (24-hour format) session ended |
| duration_hours       | NUMERIC  | Length of charging session (in hours) |
| el_kwh               | NUMERIC  | Electricity consumed (kWh) |
| month_plugin         | VARCHAR  | Month the session started |
| weekdays_plugin      | VARCHAR  | Day of the week the session started |

---

# 📊 Business Questions & SQL Solutions

---

# 1️⃣ Unique Users per Shared Garage

## 🔎 Problem

Find the number of **unique individuals** that use each garage’s shared charging stations.

Requirements:
- Include two columns: `garage_id` and `num_unique_users`
- Sort results from highest to lowest number of users
- Save result as: `unique_users_per_garage`

## 💻 SQL Solution

```sql
SELECT 
    garage_id,
    COUNT(DISTINCT user_id) AS num_unique_users
FROM charging_sessions
WHERE user_type = 'Shared'
GROUP BY garage_id
ORDER BY num_unique_users DESC;
```

## 📌 Insight

This helps identify which garages experience the highest demand for shared charging stations.

---

# 2️⃣ Top 10 Most Popular Shared Charging Start Times

## 🔎 Problem

Find the top 10 most popular charging start times (by weekday and start hour) for sessions using shared charging stations.

Requirements:
- Output columns:
  - `weekdays_plugin`
  - `start_plugin_hour`
  - `num_charging_sessions`
- Sort from most to least sessions
- Limit results to 10
- Save result as: `most_popular_shared_start_times`

## 💻 SQL Solution

```sql
SELECT
    weekdays_plugin,
    start_plugin_hour,
    COUNT(user_id) AS num_charging_sessions
FROM charging_sessions
WHERE user_type = 'Shared'
GROUP BY weekdays_plugin, start_plugin_hour
ORDER BY num_charging_sessions DESC
LIMIT 10;
```

## 📌 Insight

This reveals peak charging demand windows, allowing management to:

- Add more charging ports
- Introduce time-based policies
- Optimize load distribution

---

# 3️⃣ Users with Average Charging Duration > 10 Hours

## 🔎 Problem

Find users whose **average charging duration exceeds 10 hours** when using shared charging stations.

Requirements:
- Output columns:
  - `user_id`
  - `avg_charging_duration`
- Sort from highest to lowest average duration
- Save result as: `long_duration_shared_users`

## 💻 SQL Solution

```sql
SELECT
    user_id,
    AVG(duration_hours) AS avg_charging_duration
FROM charging_sessions
WHERE user_type = 'Shared'
GROUP BY user_id
HAVING AVG(duration_hours) > 10
ORDER BY avg_charging_duration DESC;
```

## 📌 Insight

This identifies users who may be occupying shared charging stations for extended periods, potentially reducing availability for others.

---

# 🧠 SQL Concepts Demonstrated

- `COUNT(DISTINCT)`
- `GROUP BY`
- `ORDER BY`
- `LIMIT`
- `HAVING`
- Aggregate functions (`COUNT`, `AVG`)
- Conditional filtering using `WHERE`
- Analytical thinking with business context

---

# 📈 Business Impact

This analysis enables apartment building managers to:

- Monitor shared infrastructure usage
- Identify peak demand periods
- Detect potential charger monopolization
- Make data-driven decisions for capacity planning

---

# 🛠 Tools Used

- PostgreSQL
- SQL
- GitHub

---

# 🚀 Skills Demonstrated

- Translating business questions into SQL queries
- Writing clean and optimized aggregation queries
- Using filtering and grouping effectively
- Analytical problem solving
- Structuring portfolio-ready SQL projects

---

## 👤 Author

Sid  
Aspiring Data Analyst | Building practical SQL projects to strengthen analytical skills

