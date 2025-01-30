# Restaurant Sales Analysis using SQL

This project analyzes restaurant sales data using SQL queries to gain insights into menu item popularity, revenue trends, and order patterns.  It provides a comprehensive overview of key performance indicators (KPIs) that can inform business decisions related to menu optimization, pricing strategies, and operational efficiency.

## Project Overview

This SQL project focuses on analyzing a restaurant's sales data stored in two related tables: `menu_items` and `order_details`. The `menu_items` table contains information about each item on the menu, including its name, category, and price. The `order_details` table records the details of each order, such as the order ID, item ID, and order date.

The project utilizes SQL queries to answer key business questions, including:

* **Menu Item Performance:**
    * Identifying the most and least popular items.
    * Determining the top 10 most popular items.
    * Calculating the average price of items within each category.
    * Analyzing menu items by revenue generated.
* **Revenue Analysis:**
    * Calculating total revenue.
    * Breaking down revenue by category.
* **Order Analysis:**
    * Determining the total number of orders.
    * Analyzing orders per day of the week.
    * Calculating the average order value.
* **Data Preparation:**
    * Ensuring price data is formatted correctly (2 decimal places).

## Dataset

The dataset consists of two tables:

* **`menu_items`:**
    * `menu_item_id` (INT, PRIMARY KEY): Unique identifier for each menu item.
    * `item_name` (VARCHAR): Name of the menu item.
    * `category` (VARCHAR): Category of the menu item (e.g., Appetizers, Entrees, Desserts).
    * `price` (DECIMAL): Price of the menu item.

* **`order_details`:**
    * `order_id` (INT): Unique identifier for each order.
    * `item_id` (INT, FOREIGN KEY referencing `menu_item_id`): ID of the menu item included in the order.
    * `order_date` (DATE): Date and time when the order was placed.

## SQL Queries and Insights

The project includes a series of SQL queries designed to extract meaningful insights from the data.  Key queries and their corresponding insights include:

1. **Total Number of Orders:** Provides a basic measure of overall business volume.
2. **Total Unique Menu Items:** Helps understand the breadth of the menu.
3. **Most/Least Popular Items:** Identifies top and bottom performers, informing menu adjustments.
4. **Top 10 Most Popular Items:**  Focuses on the star items driving sales.
5. **Average Price by Category:** Enables analysis of pricing strategy by category.
6. **Total Revenue:** A crucial metric for business performance.
7. **Revenue by Category:**  Pinpoints which categories contribute most to revenue.
8. **Menu Item by Revenue:**  Provides a granular view of revenue generation by individual item.
9. **Orders per Day of the Week:**  Reveals peak and slow days, useful for staffing and inventory management.
10. **Average Order Value:**  Indicates the average amount spent per order.

## Tools and Technologies

* **SQL:**  The primary language used for data manipulation and analysis.
* **Database Management System (DBMS):**  SQL Server.
* **GitHub:** Used for project sharing.

## How to Run the Queries

1. Clone the repository to your local machine.
2. Connect to your DBMS.
3. Import the `menu_items` and `order_details` tables into your database.
4. Execute the SQL scripts in the project directory.
