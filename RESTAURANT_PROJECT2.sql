
/* Updated price of the items to 2 decimal points
UPDATE menu_items
SET price = ROUND(price,2);*/

/* 1. Total numer of orders*/
SELECT COUNT (DISTINCT order_id) Total_orders
FROM order_details;


/* 2. Total unique items in the menu*/
SELECT COUNT (DISTINCT item_name)
FROM menu_items;


/* 3. Most popular item on the menu*/
SELECT TOP 1 mi.item_name, COUNT(od.item_id) AS Order_count
FROM order_details od
JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY item_name
ORDER BY Order_count DESC;


/* 4. Least popular item on the menu*/
SELECT TOP 1 mi.item_name, COUNT(od.item_id) AS Order_count
FROM order_details od
JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY item_name
ORDER BY Order_count ASC;


/* 5.Top 10 most popular item*/
SELECT TOP 10 mi.item_name, COUNT(*) AS Order_Count
FROM Order_details od
JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name
ORDER BY Order_Count DESC;


/* 6.Average price of each item in category*/
SELECT mi.category, ROUND(AVG(mi.price),2) AS Average_Price
FROM menu_items mi
GROUP BY mi.category;


/* 7. Total revenue*/
SELECT SUM(mi.price * COUNT(od.item_id)) AS total_revenue
FROM order_details od
JOIN menu_items mi ON od.item_id = mi.menu_item_id;


/* 8. Revenue by category*/
WITH OrderItemCounts AS 
		( SELECT od.item_id,COUNT(*) AS item_count
		  FROM order_details od
		  GROUP BY od.item_id
		)

SELECT mi.category, ROUND(SUM(mi.price * oic.item_count),2) AS category_revenue
FROM menu_items mi
INNER JOIN OrderItemCounts oic ON mi.menu_item_id = oic.item_id
GROUP BY mi.category;


/* 9. Menu item by revenue*/
WITH ItemCounts 
	AS ( SELECT od.item_id, COUNT(*) AS order_count
    FROM order_details od
    GROUP BY od.item_id
					)
SELECT mi.item_name, ic.order_count AS item_orders, mi.price, ROUND(SUM(mi.price * ic.order_count),2) AS item_revenue
FROM menu_items mi
JOIN ItemCounts ic ON mi.menu_item_id = ic.item_id
GROUP BY mi.item_name, ic.order_count, mi.price
ORDER BY item_revenue DESC;


/* 10. Orders per day of the week*/

/* With case statement */
SELECT DATENAME(WEEKDAY, order_date) AS day_of_week, COUNT(*) AS order_count
FROM order_details
GROUP BY DATENAME(WEEKDAY, order_date)
ORDER BY

CASE 
	WHEN DATENAME(WEEKDAY, order_date) = 'Sunday' THEN 1
    WHEN DATENAME(WEEKDAY, order_date) = 'Monday' THEN 2
    WHEN DATENAME(WEEKDAY, order_date) = 'Tuesday' THEN 3
    WHEN DATENAME(WEEKDAY, order_date) = 'Wednesday' THEN 4
    WHEN DATENAME(WEEKDAY, order_date) = 'Thursday' THEN 5
    WHEN DATENAME(WEEKDAY, order_date) = 'Friday' THEN 6
    WHEN DATENAME(WEEKDAY, order_date) = 'Saturday' THEN 7
END;

/* With subquery */
SELECT day_of_week, order_count
FROM (
    SELECT DATENAME(WEEKDAY, order_date) AS day_of_week, COUNT(*) AS order_count,
           DATEPART(WEEKDAY, order_date) AS weekday_num
    FROM order_details
    GROUP BY DATENAME(WEEKDAY, order_date), DATEPART(WEEKDAY, order_date)
	 ) AS order_summary
ORDER BY weekday_num ASC;


/* 11. Average order value*/
SELECT CONVERT(DECIMAL (10,2), AVG(total_price)) AS avg_order_value
FROM (
    SELECT od.order_id, SUM(mi.price) AS total_price
    FROM order_details od
    JOIN menu_items mi ON od.item_id = mi.menu_item_id
    GROUP BY od.order_id
) AS order_totals;