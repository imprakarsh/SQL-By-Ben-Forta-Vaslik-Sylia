-- Problem 1 : 
SELECT
    cust_name,
    order_num
FROM
    Customers
    INNER JOIN Orders ON Customers.cust_id = Orders.cust_id
ORDER BY
    cust_name,
    order_num;

-- Problem 2 :
-- Method 1 
SELECT
    cust_name,
    Orders.order_num,
    SUM(item_price * quantity)
FROM
    Customers,
    Orders,
    OrderItems
WHERE
    Customers.cust_id = Orders.cust_id
    AND Orders.order_num = OrderItems.order_num
GROUP BY
    cust_name,
    Orders.order_num
ORDER BY
    cust_name,
    Orders.order_num;

-- METHOD 2
SELECT
    cust_name,
    order_num,
    (
        SELECT
            SUM(item_price * quantity)
        FROM
            Orderitems
        WHERE
            Orders.order_num = Orderitems.order_num
    ) AS Order_Total
FROM
    Customers,
    Orders
WHERE
    Customers.cust_id = Orders.cust_id
ORDER BY
    cust_name,
    order_num;

--   Problem 3 : 
SELECT
    order_date
FROM
    Orders,
    OrderItems
WHERE
    Orders.order_num = OrderItems.order_num
    AND prod_id = 'BR01';

-- Problem 4 : 
-- Method 1 
SELECT
    cust_email,
    cust_name
FROM
    Orders
    INNER JOIN Customers ON Orders.cust_id = Customers.cust_id
    INNER JOIN OrderItems ON Orders.order_num = OrderItems.order_num
WHERE
    prod_id = 'BR01';

-- Method 2 
SELECT
    cust_email,
    cust_name
FROM
    Customers,
    Orders,
    OrderItems
WHERE
    Customers.cust_id = Orders.cust_id
    AND Orders.order_num = OrderItems.order_num
    AND prod_id = 'BR01';

-- Problem : 5
SELECT
    cust_name,
    SUM(quantity * item_price) AS total_amount
FROM
    Orders
    INNER JOIN Customers ON Orders.cust_id = customers.cust_id
    INNER JOIN OrderItems ON Orders.order_num = OrderItems.order_num
GROUP BY
    cust_name
HAVING
    SUM(quantity * item_price) >= 1000;