-- Problem 1 : 
SELECT
    cust_name,
    cust_contact
FROM
    Customers
WHERE
    cust_id IN (
        SELECT
            cust_id
        FROM
            Orders
        WHERE
            order_num IN (
                SELECT
                    order_num
                FROM
                    OrderItems
                WHERE
                    item_price >= 10
            )
    );

-- Problem 2 : 
SELECT
    cust_id,
    order_date
FROM
    Orders
WHERE
    order_num IN (
        SELECT
            order_num
        FROM
            OrderItems
        WHERE
            prod_id = 'BR01'
    )
ORDER BY
    order_date;

-- Problem 3 : 
SELECT
    cust_email
FROM
    Customers
WHERE
    cust_id IN (
        SELECT
            cust_id
        FROM
            Orders
        WHERE
            order_num IN (
                SELECT
                    order_num
                FROM
                    OrderItems
                WHERE
                    prod_id = 'BR01'
            )
    );
    -- problem 4 : 
SELECT
    cust_id,
    (
        SELECT
            SUM (item_price * quantity)
        FROM
            OrderItems
        WHERE
            orderItems.order_num = orders.order_num
    ) AS total_ordered
FROM
    Orders
ORDER BY
    total_ordered DESC;

-- problem 5 :
SELECT
    prod_name,
    (
        SELECT
            SUM(quantity)
        FROM
            orderItems
        WHERE
            orderItems.prod_id = products.prod_id
    )
FROM
    product;   
