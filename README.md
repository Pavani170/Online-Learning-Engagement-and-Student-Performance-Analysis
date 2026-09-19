# Online Education Student Performance Analysis

An end-to-end analysis of student engagement, performance, and dropout risk in an online learning environment, using **SQL** for data exploration and **Power BI** for visualization.

## 📁 Project Files

| File | Description |
|---|---|
| `online_education_dataset.csv` | Raw dataset — 31,000+ student records |
| `pavani.sql` | SQL script with exploratory queries and KPI calculations |
| `pavani.pbix` | Power BI dashboard built on the dataset |

## 📊 Dataset Overview

The dataset contains one row per student, with the following fields:

- `id_student` — unique student identifier
- `gender`
- `region` — geographic region of the student
- `highest_education` — prior education level (e.g. HE Qualification, A Level)
- `studied_credits` — number of credits studied
- `imd_band` — Index of Multiple Deprivation band (socioeconomic indicator)
- `total_clicks` — total VLE (virtual learning environment) engagement clicks
- `avg_score` — average assessment score
- `engagement_level` — Low / Medium / High engagement bucket
- `performance_level` — Low / Medium / High performance bucket
- `risk_level` — dropout risk category (e.g. Low Risk, Very High Risk)
- `pass_flag` — 1 if the student passed, else 0
- `dropout_flag` — 1 if the student withdrew, else 0
- `final_result` — Pass / Fail / Withdrawn / Distinction

## 🔍 SQL Analysis

The `pavani.sql` script answers key questions such as:

- Total number of students and average score/clicks across the cohort
- Overall pass vs. dropout counts
- Student distribution and average score by **engagement level**
- Student distribution and average score by **performance level**
- Student distribution by **risk level**
- Score trends across **click bands** (0–500, 500–1000, 1000–2000, 2000–3000, 3000+)
- Dropout rate by **engagement level** and by **performance level**
- Regional breakdown of student count, average score, and average clicks
- Breakdown by **highest education level** attained

### Example query
```sql
SELECT engagement_level, 
       COUNT(DISTINCT id_student) AS total_students, 
       SUM(CASE WHEN dropout_flag = 1 THEN 1 ELSE 0 END) AS dropout_students, 
       ROUND(100.0 * SUM(CASE WHEN dropout_flag = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS dropout_rate
FROM online_education_dataset
GROUP BY engagement_level
ORDER BY dropout_rate DESC;
```

## 📈 Power BI Dashboard

`pavani.pbix` visualizes the metrics derived from the SQL analysis, including:

- Overall KPIs: total students, average score, average clicks, pass/dropout counts
- Engagement vs. performance breakdowns
- Dropout risk analysis by engagement and performance level
- Regional and education-level comparisons

> Open `pavani.pbix` in [Power BI Desktop](https://www.microsoft.com/en-us/power-platform/products/power-bi/desktop) to explore the interactive report.

## 🛠️ How to Use

1. **Set up the database**
   ```sql
   create database online_education_db;
   use online_education_db;
   ```
   Import `online_education_dataset.csv` into a table named `online_education_dataset`.

2. **Run the analysis**
   Execute the queries in `pavani.sql` against the imported table.

3. **Explore the dashboard**
   Open `pavani.pbix` in Power BI Desktop, and refresh the data source to point to your local copy of the CSV or database if needed.

## 🎯 Key Insights (from the analysis)

- Engagement level is strongly correlated with both average score and dropout rate — higher engagement generally means lower dropout and higher scores.
- Higher click bands are associated with better average scores, highlighting the value of VLE activity as an early indicator of performance.
- Risk level segmentation helps identify students who may need early intervention.

## 📌 Tech Stack

- **SQL** (MySQL syntax) — data aggregation and KPI calculation
- **Power BI** — interactive dashboarding and visualization
- **CSV** — raw data source

## 📄 License

Add your preferred license here (e.g. MIT).
