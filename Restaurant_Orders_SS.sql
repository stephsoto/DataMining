USE restaurant_db;

-- 1.View the menu_items table.
SELECT * FROM menu_items;

-- 2.Find the number of items on the menu.
SELECT COUNT(*) FROM menu_items;


-- 3.What are the least and most expensive items on the menu? ( edamame and shrimp scampi)
SELECT * FROM menu_items
ORDER BY price DESC;

-- 4.How many Italian dishes are on the menu?
SELECT COUNT(*) FROM menu_items
WHERE category = 'Italian';

-- 5. What are the least and mot expensive Italian dishes on the menu? ?( spagetthi and shrimp scampi)
SELECT * FROM menu_items
WHERE category = 'Italian'
ORDER BY price DESC;

-- 6.How many dishes are in each category? (6,8,9,9)
SELECT category, COUNT(menu_item_id) as num_dishes FROM menu_items
GROUP BY category;

-- 7.What is the average dish price within each category?
SELECT category, AVG(price) as avg_price FROM menu_items
GROUP BY category;

-- 8.View the order_details table 
SELECT * FROM order_details;


-- 9.What is the date range of the table ?
SELECT * FROM order_details
ORDER BY order_date;

SELECT MIN(order_date), MAX(order_date) FROM order_details;

-- 10.How many orders (people) we made within this date range? ( misma persona con el mismo id por eso distinct) 5370
SELECT COUNT(DISTINCT order_id) FROM order_details;


-- 11.How many items were ordered within this date range? 12234
SELECT COUNT(*) FROM order_details;


-- 12.Which orders had the most number of items?
SELECT order_id, COUNT(item_id) as num_items FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;

-- 13.How many orders had more than 12 items?
SELECT COUNT(*) FROM 

(SELECT order_id, COUNT(item_id) as num_items FROM order_details
GROUP BY order_id
HAVING num_items > 12) AS num_orders;


-- 14.Combine the menu_items and order_details tables into a single table
SELECT * FROM menu_items;
SELECT * FROM order_details;

-- you have to join first the table that has transaccions on it and the second the other table
-- she chose left join bc she wanted to keep all the info from the order table and just look up to the menu table
SELECT *
FROM order_details od LEFT JOIN menu_items mi
  ON od.item_id = mi.menu_item_id;

-- 15.What were the least and most ordered items? What categories were they in? least chix tacos(mexican), most hamburguer ( american)
SELECT item_name, category, COUNT(order_details_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
  ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases DESC;



-- 16.What were the top 5 orders that spend the most money? (440,2075,1957,330,2675)
SELECT order_id, SUM(price) as total_spent
FROM order_details od LEFT JOIN menu_items mi
  ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spent DESC
LIMIT 5;


-- 17.View the details of the highest spend order.What insights can you gather from the 
SELECT category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
     ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category;


-- 18.View the details of the top 5 highest spend orders.What insights can you gather 
SELECT order_id,category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
     ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category;

'440','192.15'
'2075','191.05'
'1957','190.10'
'330','189.70'
'2675','185.10'
