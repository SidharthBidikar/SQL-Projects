# 🎮 SQL Mini Project – Video Game Sales & Ratings Analysis

---

## 📌 Project Overview

Video games are a multi-billion dollar industry. According to Mordor Intelligence, the global gaming market is projected to exceed **$300 billion by 2027**. With such massive financial incentives, publishers are constantly trying to release the next blockbuster hit.

But an important analytical question remains:

> Are video games getting better over time, or has the golden age already passed?

In this SQL mini project, we analyze:

- 📈 Game sales performance  
- ⭐ Critic ratings  
- 👥 User ratings  
- 📅 Yearly release trends  

The dataset includes information for **400 top video games released since 1977**, containing sales and rating data.

This project focuses on applying SQL for:

- Sorting and filtering
- Aggregation
- Joining datasets
- Business-focused data interpretation

---

# 🗂 Database Schema

## 1️⃣ `game_sales`

| Column       | Description                             |
|-------------|------------------------------------------|
| name        | Name of the video game                  |
| platform    | Gaming platform                         |
| publisher   | Game publisher                          |
| developer   | Game developer                          |
| games_sold  | Number of copies sold (in millions)     |
| year        | Release year                            |

---

## 2️⃣ `reviews`

| Column       | Description                              |
|-------------|-------------------------------------------|
| name        | Name of the video game                   |
| critic_score| Critic score (Metacritic)                |
| user_score  | User score (Metacritic)                  |

---

## 3️⃣ `users_avg_year_rating`

| Column          | Description                                   |
|----------------|-----------------------------------------------|
| year           | Release year                                  |
| num_games      | Number of games released that year            |
| avg_user_score | Average user score for that year              |

---

## 4️⃣ `critics_avg_year_rating`

| Column           | Description                                  |
|-----------------|----------------------------------------------|
| year            | Release year                                 |
| num_games       | Number of games released that year           |
| avg_critic_score| Average critic score for that year           |

---

# 🎯 Project Instructions

---

## 🥇 Task 1: Ten Best-Selling Games

Find the ten best-selling games.

Requirements:

- Return all columns from `game_sales`
- Sort by `games_sold` in descending order
- Save the output as **`best_selling_games`**

---

## 🏆 Task 2: Top 10 Years by Average Critic Score

Find the ten years with the highest average critic score.

Requirements:

- Only include years with at least **4 games released**
- Return: `year`, `num_games`, `avg_critic_score`
- Round `avg_critic_score` to **2 decimal places**
- Sort by `avg_critic_score` in descending order
- Save the output as **`critics_top_ten_years`**

---

## 🌟 Task 3: Golden Years (Critics & Users Agreement)

Find the years where critics and users broadly agreed that the games released were highly rated.

Criteria:

- Average critic score > 9  
  OR  
- Average user score > 9  

Return:

- `year`
- `num_games`
- `avg_critic_score`
- `avg_user_score`
- `diff` (avg_critic_score - avg_user_score)

Sort by `year` in ascending order.

Save the output as a DataFrame named **`golden_years`**.

---

# 💻 SQL Solutions

---

## 🥇 Solution 1 – Best Selling Games

```sql
SELECT *
FROM game_sales
ORDER BY games_sold DESC
LIMIT 10;
