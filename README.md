# Bright Coffee Shop Sales Analysis ☕

## Overview

The **Bright Coffee Shop Sales Analysis** project explores historical coffee shop transaction data to identify revenue drivers, understand sales patterns, and support better business decisions.

The project is framed around the needs of a newly appointed CEO who wants to grow revenue and improve product performance. The analysis focuses on questions such as:

- Which products and product categories generate the most revenue?
- What times of day perform best?
- How do sales vary across products and time intervals?
- Which products perform well, and which may need additional attention?
- What actions could help improve sales performance?

The goal is to turn transactional data into clear, actionable insights that can support business planning and executive decision-making.

## Process

### 1. Planning and Data Architecture

- Define the business questions and key performance indicators (KPIs).
- Map the data journey from the original dataset through processing, analysis, and reporting.
- Plan the transformations and calculations needed for reliable reporting.
- Identify the visuals required to communicate the results to business stakeholders.

### 2. Data Preparation and Transformation

- Convert the original Excel dataset to CSV format where required.
- Load the data into the chosen data-processing environment.
- Inspect data types, missing values, and inconsistent numeric formats.
- Convert `unit_price` to a consistent numeric format, including correcting values that use commas as decimal separators where necessary.
- Create a time-bucket field to group transactions into 30-minute intervals (or another suitable interval, such as three hours).
- Calculate total sales amount using:

  `total_amount = unit_price * transaction_qty`

- Prepare the data for analysis by product, product category, product detail, and time interval.

### 3. Data Analysis

Use SQL, spreadsheet analysis, and/or a BI tool to explore the prepared data. Core measures and comparisons include:

- Total revenue
- Total quantity of items sold
- Revenue by product type and product detail
- Quantity sold by product category
- Sales by time interval and time of day
- High-performing and low-performing products
- Trends across the available dates and time periods

### 4. Dashboard and Reporting

Present the results using charts, tables, and KPI cards. The dashboard can include:

- KPI cards for total revenue and units sold
- Revenue trend analysis
- Product and category performance rankings
- Sales by time of day or time bucket
- Filters for available dimensions, such as date, store, category, and product
- A detail table to support deeper investigation

The dashboard should make it easy to filter the data, compare performance, and identify the strongest sales drivers.

### 5. Recommendations and Presentation

Translate the findings into practical recommendations for management. Possible actions to evaluate against the actual results include:

- Run targeted promotions during slower time slots.
- Maintain sufficient stock of best-selling items.
- Test promotions or merchandising changes for underperforming products.
- Automate recurring sales reports.
- Track performance across additional locations as the business expands.
- Consider loyalty initiatives informed by observed peak trading periods.

Recommendations should be supported by the analysis rather than treated as confirmed findings before the data has been reviewed.

## Summary

This project demonstrates an end-to-end sales analytics workflow: planning the analysis, preparing transaction data, calculating sales measures, exploring product and time-based performance, and presenting insights in a dashboard and executive report.

The expected outcome is a clearer understanding of the coffee shop's revenue drivers and sales patterns, enabling evidence-based decisions about product availability, promotions, and reporting.

**Key deliverables** for the case study include:

- Data flow and architecture plan
- Processed dataset in spreadsheet or CSV format
- Pivot tables and charts or an interactive dashboard
- SQL analysis file
- Executive presentation with key insights and recommendations

## Tools Used

The case study brief permits a range of tools. Document the tools actually used for your final submission:

- **Google Sheets / CSV** — source data preparation, validation, and spreadsheet analysis.
- **SQL** — data transformation, aggregation, and querying sales performance.
- **Databricks** — data loading and transformation environment, if used.
- **Power BI or Lovable** — dashboard design and interactive data visualization, depending on the implementation used.
- **Miro** — data flow planning and architecture diagram.
- **Google slides** — presentation of insights and recommendations.


## Business Questions

1. Which products contribute the most revenue?
2. Which time intervals generate the strongest sales?
3. Which product categories sell the highest quantities?
4. Which products are underperforming?
5. What actions could improve sales performance?

## Author

**Sixolise Klaas**  
Brightlearn student | Future Data Analytics

---

*Project brief: Bright Coffee Shop — Sales Analysis case study.*
