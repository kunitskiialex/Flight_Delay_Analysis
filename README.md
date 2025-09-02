# ✈️ Flight Delay Analysis / Аналіз Затримок Рейсів

[![Delay Map](./figures/delay_by_airport.png)](./dashboard.png)

---

## 🧠 Key Insights / Висновки

- Most delays occur between **4–8 PM (rush hours)**  
- **Summer months (June–August)** have the highest average delays  
- **Late aircraft** and **carrier issues** are the top reasons  
- Airlines differ greatly in delay behavior — some are consistently worse  

---

## 📂 Project Structure

- `data/` — cleaned datasets and SQL exports  
- `sql/` — SQL scripts for cleaning and analysis  
- `figures/` — charts and dashboards saved from Python & SQL  
- `notebooks/` — Jupyter/Colab notebooks for data analysis  

---

## 📊 SQL Data Preparation & Google Sheets Dashboard

### SQL Data Cleaning & Analysis
Performed in **PostgreSQL via DBeaver**:  
- Data type standardization (dates, numeric fields)  
- Data cleaning (NULL handling, incorrect formats)  
- Feature engineering (ROUTE, DEP_HOUR, etc.)  
- Aggregated analytical queries:  
  - Average delay by Airline  
  - Flight volume per Month  
  - Average delay by Departure Hour  
  - Top 10 Routes with the highest Arrival Delays  

📄 **SQL Script** → [flight_delay_cleaning_and_analysis.sql](./sql/flight_delay_cleaning_and_analysis.sql)

### Exported Query Results
SQL query outputs exported to CSV → used for Google Sheets dashboard.  

📂 **Cleaned outputs** → [data/cleaned_sql_outputs/](./data/cleaned_sql_outputs/)

---

### 📈 Google Sheets Interactive Dashboard

We created an **interactive Google Sheets dashboard** with:  
- Pivot Tables for Airline and Route analysis  
- Slicers (Airline, Month, Hour) controlling all charts and tables  
- KPI Summary Cards  
- Visualizations (Bar Charts, Line Charts)  

🔗 **Live Dashboard** → [Open in Google Sheets](https://docs.google.com/spreadsheets/d/11krsk7PutKf4ZDu38z-Ji4iirhx49h0zEpUBD92J6e8/edit?usp=sharing)

---

## 🛠️ Skills Demonstrated
- SQL Data Cleaning & Aggregation  
- Pivot Table and KPI Creation  
- Slicer-based Dashboard Filtering  
- Data Storytelling via Google Sheets  

---

## 📊 Dashboard Preview
*(static preview — click for full interactive version)*  

![Sheets Dashboard](./figures/google_sheets_dashboard_preview.png)











