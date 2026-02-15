# International Student Mental Health Analysis (SQL)

## 📌 Project Overview

Studying abroad can be both exciting and challenging. This SQL mini project analyzes survey data from a Japanese international university to explore how the **length of stay** impacts the mental health of international students.

The goal of this analysis was to determine whether the number of years a student has stayed in the host country is associated with changes in:

- Depression levels (PHQ-9)
- Social connectedness (SCS)
- Acculturative stress (ASISS)

---

## 🎯 Objective

Analyze the `students` dataset to:

- Focus only on **international students**
- Group students by their length of stay (`stay`)
- Calculate:
  - Number of international students per stay duration
  - Average depression score
  - Average social connectedness score
  - Average acculturative stress score
- Round averages to two decimal places
- Sort results by length of stay in descending order

---

## 🧩 Dataset Description

**Granularity:**  
1 row = 1 student

### Relevant Columns Used

- `inter_dom` → Student type (international or domestic)
- `stay` → Length of stay in years
- `todep` → Depression score (PHQ-9)
- `tosc` → Social connectedness score (SCS)
- `toas` → Acculturative stress score (ASISS)

---

## 🛠 SQL Skills Demonstrated

- Filtering using `WHERE`
- Grouping using `GROUP BY`
- Aggregation using:
  - `COUNT()`
  - `AVG()`
- Numeric formatting using `ROUND()`
- Column aliasing
- Sorting using `ORDER BY`
- Data segmentation (international students only)

---

## 🧮 Final Query

```sql
SELECT 
    stay,
    COUNT(*) AS count_int,
    ROUND(AVG(todep),2) AS average_phq,
    ROUND(AVG(tosc),2) AS average_scs,
    ROUND(AVG(toas),2) AS average_as
FROM students
WHERE inter_dom = 'Inter'
GROUP BY stay
ORDER BY stay DESC;
```
-<img width="922" height="756" alt="Screenshot 2026-02-16 025934" src="https://github.com/user-attachments/assets/75894ab1-c7a7-4bde-8194-d55dab582c10" />
--

## 📊 Key Observations

- Students with shorter stays (1–3 years) represent the largest population group.
- Acculturative stress tends to be higher among students in earlier years of stay.
- Social connectedness appears relatively stable across stay durations.
- Smaller sample sizes in higher stay durations (e.g., 8–10 years) may limit interpretability.

---

## 🧠 Analytical Insight

The results suggest that length of stay may influence mental health indicators, particularly acculturative stress levels among newer international students. However, variation in sample size across groups should be considered when interpreting trends.

---

## 📁 Files Included

- `analysis.sql` → SQL query used for analysis
