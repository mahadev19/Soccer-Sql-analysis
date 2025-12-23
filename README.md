# ⚽ European Soccer SQL Analysis & Performance Insights

An end-to-end **data analytics project** using the European Soccer Database to analyze **team performance, player quality, match trends, and tactical attributes** using **SQL, Python, and Power BI**.

---

## 📌 Project Overview

This project focuses on extracting meaningful insights from a large football (soccer) dataset using **advanced SQL queries**, followed by **statistical correlation analysis in Python** and **interactive visualizations in Power BI**.

The goal is to demonstrate:
- Strong SQL querying skills
- Data cleaning & exploration
- Analytical thinking
- Visualization and storytelling
- Professional Git/GitHub practices

---

## 🗂 Dataset Information

- **Dataset:** European Soccer Database  
- **Source:** Kaggle  
- **Database Type:** SQLite  
- **Records:** 25,000+ matches across multiple European leagues  

>  The full database dump (`database.sql`) is included using **Git LFS** due to GitHub’s file size limits.

---

## 🛠 Tools & Technologies Used

- **SQL (SQLite)** – CTEs, CASE statements, joins, aggregations . Window Function
- **Python** – Pandas, SciPy, Matplotlib, Seaborn  
- **Power BI** – Interactive dashboards & KPIs  
- **Git & GitHub** – Version control, Git LFS  
- **DB Browser for SQLite**

---

## 📊 Key Analysis Performed

### 🔹 SQL-Based Analysis
- Data quality checks (nulls, duplicates, date formats)
- Team performance metrics (wins, losses, draws, points)
- Top teams by total points
- Top players by average overall rating & potential
- Goals per match trends across seasons
- Home vs away win percentage analysis
- Team attributes vs win rate analysis

---

### 🔹 Python Statistical Analysis
- Correlation between **defensive pressure** and **goals conceded**
- Pearson correlation coefficient & significance testing
- Regression visualization for relationship interpretation

---

### 🔹 Power BI Visualization
- Goals per season trend (line chart)
- Top teams by points (bar chart)
- Home vs Away vs Draw distribution
- Team defensive attributes vs win rate (scatter plot)

---

## 📈 Key Insights

- Home teams have a significantly higher win percentage than away teams
- Teams with higher defensive pressure tend to concede fewer goals
- Average goals per match vary noticeably across seasons
- High-rated players consistently maintain high potential
- Tactical team attributes influence match outcomes

---

## 🖼 Power BI Dashboard Preview

> GitHub cannot render Power BI files directly.  
> Screenshots and PDF export are provided for easy viewing.

<img width="888" height="499" alt="image" src="https://github.com/user-attachments/assets/b2a33573-2a2f-4dd5-9f89-126a6127b9c2" />

---

## 📁 Project Structure
Soccer_SQL_analysis/
│── database.sql # Full database (tracked via Git LFS)
│── SQL_Quries.sql # All SQL queries used
│── outputs/
│ ├── top_teams_points.csv
│ ├── top_players_ratings.csv
│ ├── goals_by_season.csv
│ ├── home_away_win_pct.csv
│ ├── team_attribute_win_rate.csv
│ └── defence_pressure_vs_goals_conceded.csv
│── Correlation_analysis.ipynb # Python correlation analysis
│── Analysis.pbix # Power BI report
│── README.md


---

## ▶ How to Run the Project

### 1️⃣ SQL Analysis
- Open `database.sql` in **DB Browser for SQLite**
- Run queries from `sql_queries.sql`

### 2️⃣ Python Analysis
```bash
pip install pandas scipy matplotlib seaborn

## Contact

Mahadev Bharat Pandharpote

Contact : gmail:- pandmahadev120@gmail.com

linkedin :- https://www.linkedin.com/in/mahadev-data-scientist/

twitter : - https://x.com/Mahadev_Py

Portfolio : - https://mahadev.me/
