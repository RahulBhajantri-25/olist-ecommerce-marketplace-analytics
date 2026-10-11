# E-Commerce Marketplace Operations & Customer Experience Analytics

## Project Overview
This project analyzes e-commerce marketplace data to understand sales performance, product category revenue, seller performance, delivery efficiency, and customer experience.

The analysis uses the Brazilian Olist e-commerce dataset to identify business trends and translate data into actionable insights through SQL analysis and an interactive Power BI dashboard.

## Business Objectives
- Analyze total revenue, freight costs, order volume, and average order value.
- Identify high-revenue product categories and geographic markets.
- Evaluate seller performance.
- Understand customer review scores and delivery performance.
- Examine customer purchasing patterns and repeat-customer behavior.

## Tools & Technologies
- **Python:** Data cleaning and exploratory data analysis
- **Pandas:** Data manipulation and preparation
- **MySQL:** Business analysis using SQL queries
- **Power BI:** Interactive dashboard and visualizations
- **Jupyter Notebook:** Analysis workflow
- **Microsoft Excel / CSV:** Data exchange and reporting

## Key Findings
- **Total item revenue:** 13,591,643.70
- **Total freight:** 2,251,909.54
- **Orders in dataset:** 99,441
- **Average order value:** 137.75
- **Average review score:** 4.09 out of 5
- **Positive reviews (4–5 stars):** 77.07%
- **Delivered orders:** 96,478
- **Repeat-customer rate:** 3.05%

*Note: Revenue and freight values are in the dataset's monetary units. Average order value is calculated using item revenue and distinct orders with items.*

## SQL Analysis
The SQL analysis covers:
- Revenue and freight metrics
- Monthly revenue trends
- Revenue by product category and state
- Seller performance
- Payment method distribution
- Order status distribution
- Review score analysis
- Delivery performance
- Customer segments
- Monthly revenue changes and seller rankings

## Power BI Dashboard
The interactive dashboard includes:
- KPI cards for revenue, freight, orders, and average order value
- Monthly revenue trend
- Product category revenue
- Revenue by state
- Order status distribution
- Customer review score distribution
- On-time versus late delivery performance
- Customer segmentation
- State slicer for filtering the relevant visualizations

## Project Workflow
1. Clean and explore the dataset using Python and Pandas.
2. Import the prepared data into MySQL.
3. Write SQL queries to answer business questions.
4. Export query results as CSV files.
5. Build and format an interactive Power BI dashboard.
6. Summarize business findings for reporting.

## Business Value
This project demonstrates how data analytics can support marketplace decision-making by identifying revenue drivers, monitoring seller performance, measuring delivery outcomes, and understanding customer satisfaction.

## Repository Contents
- `Notebooks/` — Python analysis notebooks
- `Data/` — Dataset and dashboard CSV files
- `02_business_analysis.sql` — Business analysis queries
- `03_advanced_analysis.sql` — Advanced analysis queries
- `E-Commerce_Marketplace_Analytics.pbix` — Power BI dashboard
- `README.md` — Project documentation

*Folder and file names may vary slightly depending on the final repository structure.*

## Conclusion
The project combines Python, SQL, and Power BI to demonstrate an end-to-end data analytics workflow, from data preparation and business analysis to interactive reporting and insight communication.
