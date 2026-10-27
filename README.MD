# ☕ Cafe Sales Data Analysis: From Dirty Data to Insights

## 📌 Project Overview
The primary purpose of this project is to take a raw, heavily corrupted cafe sales dataset, clean the data, and perform exploratory data analysis. The goal is to transform the messy data into accurate, actionable business intelligence that a cafe owner can use to make informed operational decisions.

## 🎯 Business Questions & Objectives
The analysis was driven by the following core business questions:
1. **Overall Business Health:** What is the total revenue generated, total transactions, and the Average Order Value (AOV)?
2. **Product Performance:**Which specific items generate the highest revenue and should be prioritized in inventory?
3. **Daily Trends:** How does revenue fluctuate by month and day of the week?
4. **Monthly Trends:** How does revenue trend across the months of the year, and are there seasonal peaks or slumps?
5. **Location Performance:** Which cafe branch is the most profitable?

## 🧹 Data Cleaning & Pipeline (SQL + Python)
The raw dataset contained severe data quality issues, including text placeholders (`"ERROR"`, `"UNKNOWN"`) in numerical columns, missing values, and inconsistent data types.
*   **SQL Phase:** Loaded the raw CSV into PostgreSQL. Used SQL to replace dirty text values with `NULL`, correctly cast columns to `REAL`, `INTEGER`, and `DATE`, and exported the clean dataset.
*   **Python Phase:** Loaded the clean CSV into Pandas. Handled remaining `NaN` values and extracted date features (Day of Week, Month) for time-series analysis.

## 💡 Key Business Insights Discovered

### 1. Overall Business Health
*   **Total Revenue:** Generated **$[Insert Total]** across **10,000** unique transactions.
*   **Average Order Value (AOV):** Customers spend an average of **$8.93** per transaction. 
*   *Business Impact:* The stable AOV indicates a healthy flow of small-to-medium purchases.

### 2. Product Performance
*   **Top Revenue Drivers:** The top 3 products are **[Insert Top 1]**, **[Insert Top 2]**, and **[Insert Top 3]**. 
*   *Business Impact:* Inventory management should prioritize these items to prevent stockouts, and marketing efforts should be centered around them.

### 3. Time & Seasonality 
*   **Daily Trends:** Revenue is highly consistent throughout the week. The peak day is **Thursday ($12,394)** and the slowest is **Wednesday ($11,616)**. 
*   *Business Impact:* Because there is no massive weekend spike, the cafe can maintain stable staffing levels 7 days a week.
*   **Monthly Trends:** The highest revenue was recorded in **[Insert Month]**, and the lowest in **[Insert Month]**. *(e.g., indicating a summer slump or holiday peak).*

### 4. Operational & Customer Insights
*   **Peak Hours:** The cafe generates the most revenue during **[Insert Peak Hour, e.g., 8:00 AM]**. 
*   *Business Impact:* The owner should schedule additional staff to handle the "rush hour" and ensure fast service.
*   **Payment Methods:** **[Insert %, e.g., 75%]** of customers prefer to pay by **[Insert Method, e.g., Credit Card]**.
*   *Business Impact:* Ensure the preferred payment infrastructure is fast and reliable to avoid bottlenecks.
*   **Location Performance:** The **[Insert Best Location]** branch generates the highest revenue.
*   *Business Impact:* Investigate what makes this location successful (e.g., foot traffic, staff) and apply those strategies to underperforming branches.

## 🛠️ Tech Stack
*   **Database:** PostgreSQL
*   **Analysis:** Python (Pandas, Matplotlib, Seaborn)
*   **Environment:** VS Code / Jupyter Notebooks
*   **Dashboard:** Power BI *(Coming next!)*

---

#### PROJECT STRUCTURE:
```
cafe-sales-dirty-to-dashboard/
│
├── README.md                          ← Project story (most important!)
├── .gitignore                         ← Ignore junk files
│
├── data/
│   ├── raw/
│   │   └── dirty_cafe_sales.csv       ← Original (never edit)
│   └── cleaned/
│       └── cafe_sales_clean.csv       ← Output from SQL/Python
│
├── sql/
│   ├── 00_create_database.sql         ← Setup
│   ├── 01_create_table.sql            ← Table schema
│   ├── 02_load_data.sql               ← COPY from CSV
│   ├── 03_explore_data.sql            ← First look (nulls, dupes)
│   ├── 04_clean_data.sql              ← THE cleaning step ⭐
│   └── 05_export_clean.sql            ← Save cleaned data
│
├── python/
│   ├── 01_load_and_check.py           ← Load cleaned CSV
│   ├── 02_eda_analysis.ipynb          ← EDA + charts ⭐
│   └── requirements.txt               ← Dependencies
│
├── powerbi/
│   ├── cafe_sales_dashboard.pbix      ← Power BI file
│   └── dashboard.png                  ← Screenshot for README
│
└── images/
    ├── before_cleaning.png
    ├── after_cleaning.png
    └── eda_charts.png
```