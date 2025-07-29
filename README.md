# ✈️ Flight Delay Analysis / Аналіз Затримок Рейсів

---

## 📄 Summary / Опис

This project analyzes flight delays using a dataset of 3 million records.  
We explore which factors cause delays, when and where they happen most often, and visualize patterns.  
The project demonstrates data cleaning, analysis, visualization, and insights extraction.

Цей проєкт аналізує затримки авіарейсів на основі вибірки з 3 мільйонів записів.  
Ми досліджуємо, що спричиняє затримки, коли і де вони найчастіші, візуалізуємо закономірності.  
Мета — продемонструвати вміння в аналітиці, очищенні та візуалізації даних.

---

## 🎯 Objectives / Цілі

- Understand the main causes of flight delays.
- Identify patterns by time, airline, and location.
- Practice data wrangling, visualization, and storytelling.
- Create a presentable portfolio project for GitHub.

---

## 📊 Dataset

- 📁 File: `flights_sample_3m.csv`,https://drive.google.com/file/d/1uuv4AzuoHFjo2HCsVbEeDVEAb9GaQdq1/view?usp=sharing
- https://drive.google.com/file/d/1_lka8aI1Pml2z1FKqKq9CYRgYk5-rnA8/view?usp=sharing
- 📦 Size: ~3 million records
- 📌 Columns: `FL_DATE`, `ORIGIN`, `DEST`, `CARRIER`, `DEP_DELAY`, `ARR_DELAY`, `DEP_HOUR`, `CANCELLED`, various delay types

---

## 🧰 Stack / Технології

- Python (Pandas, NumPy, Matplotlib, Seaborn)
- Google Colab
- SQL (Looker Studio – optional)
- Tableau (optional)
- Google Sheets (optional)

---

## 🧹 Data Cleaning

- Removed missing, duplicated, and invalid values
- Parsed datetime fields
- Filtered cancelled/diverted flights
- Combined individual delay reasons into a `TOTAL_DELAY` column

---

## 📈 EDA & Visualizations / Візуалізації

### ✈️ Average Departure Delay by Airline
[![Airline Delay](figures/delay_by_airline.png)](https://github.com/kunitskiialex/Flight_Delay_Analysis/blob/main/airline_delay.png)

---

### 🕒 Delay by Departure Hour
[hourly_delay.png](https://github.com/kunitskiialex/Flight_Delay_Analysis/blob/main/hourly_delay.png)

---

### 🔥 Heatmap: Average Delay by Month & Hour
[![Heatmap](figures/delay_heatmap.png)
](https://github.com/kunitskiialex/Flight_Delay_Analysis/blob/main/avg_total_delay_heatmap.png)
---

### 🗺️ Delay by Origin Airport (optional)
[![Delay Map](figures/delay_by_airport.png)](https://github.com/kunitskiialex/Flight_Delay_Analysis/blob/main/dashboard.png)

---

## 🧠 Key Insights / Висновки

- Most delays occur between 4–8 PM (rush hours).
- Summer months (June–August) have the highest average delays.
- Late aircraft and carrier issues are the top reasons.
- Airlines differ greatly in delay behavior — some are consistently worse.

---

## 📂 Project Structure

