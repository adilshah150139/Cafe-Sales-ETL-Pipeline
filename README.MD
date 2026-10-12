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