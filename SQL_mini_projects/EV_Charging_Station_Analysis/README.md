# EV Charging Station Usage Analysis

## 📌 Project Overview

As electric vehicles (EVs) become increasingly popular, the demand for accessible charging stations continues to rise. Many modern apartment buildings have introduced shared charging stations in their parking garages to accommodate tenants.

This project analyzes EV charging session data using SQL to help building managers understand:

- Shared charging usage across garages
- Peak charging start times
- Users with unusually long charging durations

All analysis is performed using PostgreSQL on the `charging_sessions` dataset.

---

## 🗂 Dataset Information

### Table: `charging_sessions`

| Column | Description | Data Type |
|--------|-------------|-----------|
| garage_id | Identifier for the garage/building | VARCHAR |
| user_id | Identifier for the individual user | VARCHAR |
| user_type | Indicates whether the station is Shared or Private | VARCHAR |
| start_plugin | Timestamp when session started | DATETIME |
| start_plugin_hour | Hour session started (24-hour format) | NUMERIC |
| end_plugout | Timestamp when session ended | DATETIME |
| end_plugout_hour | Hour session ended (24-hour format) | NUMERIC |
| duration_hours | Length of charging session in hours | NUMERIC |
| el_kwh | Electricity used (kWh) | NUMERIC |
| month_plugin | Month session started | VARCHAR |
| weekdays_plugin | Day of week session started | VARCHAR |

---

# 🔎 Analysis & SQL Queries

---

## 1️⃣ Unique Shared Users per Garage

Determine the number of distinct users utilizing shared charging stations in each garage.

**Saved As:** `unique_users_per_garage`

```sql
SELECT
    garage_id,
    COUNT(DISTINCT user_id) AS num_unique_users
FROM charging_sessions
WHERE user_type = 'Shared'
GROUP BY garage_id
ORDER BY num_unique_users DESC;
