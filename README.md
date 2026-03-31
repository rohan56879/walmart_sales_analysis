# walmart_sales_analysis
This project analyzes Walmart sales data using SQL to discover business insights such as seasonal sales trends, store performance, holiday impact on sales, and weekly sales growth using window functions like LAG() and ranking functions.


# Walmart Sales Data Analysis (SQL Project)

## Project Overview

This project analyzes Walmart retail sales data using SQL to discover meaningful business insights.
The analysis focuses on identifying sales trends, store performance, seasonal patterns, and the impact of holidays on weekly sales.

The goal of this project is to demonstrate practical **data analysis skills using SQL**, including aggregation, filtering, window functions, and time-series analysis.

---

## Dataset Information

The dataset contains weekly sales data for multiple Walmart stores along with economic and environmental factors.

**Columns in the dataset:**

* Store
* Date
* Weekly_Sales
* Holiday_Flag
* Temperature
* Fuel_Price
* CPI
* Unemployment
* Month
* Season
* Temperature_Category

---

## Objectives of the Analysis

The project answers several business questions, including:

* Which stores generate the highest sales?
* How do sales change across different seasons?
* Do holidays impact sales performance?
* What is the week-over-week sales growth for each store?
* Which store performs best in each season?

---

## SQL Concepts Used

This project demonstrates the use of several important SQL concepts:

* SELECT statements
* GROUP BY and aggregation functions
* Filtering using WHERE
* Subqueries
* Window functions
* Ranking functions (RANK)
* Time-series analysis using LAG

---

## Key Analysis Performed

### 1. Top Performing Stores

Identified stores with the highest total sales.

### 2. Seasonal Sales Trends

Analyzed how sales vary across Winter, Spring, Summer, and Fall.

### 3. Holiday Sales Impact

Compared average sales during holiday weeks vs non-holiday weeks.

### 4. Store Ranking

Ranked stores based on total sales using window functions.

### 5. Week-over-Week Sales Change

Calculated sales differences between consecutive weeks using the `LAG()` function.

---

