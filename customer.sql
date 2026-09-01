**Schema (MySQL v9)**

    -- ============================================
    -- CREATE DATABASE
    -- ============================================
    
    CREATE DATABASE ecommerce_db;
    
    USE ecommerce_db;
    
    
    -- ============================================
    -- CUSTOMER TABLE
    -- ============================================
    
    CREATE TABLE customer (
        customer_id INT PRIMARY KEY,
        name VARCHAR(255)
    );
    
    
    -- ============================================
    -- PURCHASE TABLE
    -- ============================================
    
    CREATE TABLE purchase (
        purchase_id INT PRIMARY KEY,
        purchase_time TIMESTAMP NOT NULL,
        customer_id INT NOT NULL,
    
        FOREIGN KEY (customer_id)
            REFERENCES customer(customer_id)
    );
    
    
    -- ============================================
    -- PURCHASE_ITEM TABLE
    -- ============================================
    
    CREATE TABLE purchase_item (
        purchase_item_id INT PRIMARY KEY,
        purchase_id INT NOT NULL,
        product_name VARCHAR(255),
        quantity INT NOT NULL,
        total_amount_paid DECIMAL(10,2) NOT NULL,
    
        FOREIGN KEY (purchase_id)
            REFERENCES purchase(purchase_id)
    );
    
    
    -- ============================================
    -- INSERT CUSTOMERS
    -- ============================================
    
    INSERT INTO customer (customer_id, name) VALUES
    (101, 'Ahmed'),
    (102, 'Rahul'),
    (103, 'John'),
    (104, 'Sara'),
    (105, 'Ali'),
    (106, 'Priya'),
    (107, 'David'),
    (108, 'Fatima');
    
    
    -- ============================================
    -- INSERT PURCHASES
    -- ============================================
    
    INSERT INTO purchase
    (purchase_id, purchase_time, customer_id)
    VALUES
    
    -- Customer 101
    (1001, '2026-06-10 10:30:00', 101),
    (1002, '2026-07-02 05:11:00', 101),
    (1003, '2026-08-26 11:15:00', 101),
    
    -- Customer 102
    (1004, '2026-06-15 14:20:00', 102),
    (1005, '2026-07-18 09:45:00', 102),
    (1006, '2026-08-20 18:30:00', 102),
    
    -- Customer 103
    (1007, '2026-05-20 11:00:00', 103),
    (1008, '2026-07-05 16:40:00', 103),
    (1009, '2026-08-22 20:15:00', 103),
    
    -- Customer 104
    (1010, '2026-06-12 09:30:00', 104),
    (1011, '2026-07-25 13:15:00', 104),
    
    -- Customer 105
    (1012, '2026-06-05 15:10:00', 105),
    (1013, '2026-08-10 19:20:00', 105),
    
    -- Customer 106
    (1014, '2026-05-18 10:00:00', 106),
    (1015, '2026-07-12 17:30:00', 106),
    
    -- Customer 107
    (1016, '2026-06-22 12:00:00', 107),
    (1017, '2026-08-05 21:00:00', 107),
    
    -- Customer 108
    (1018, '2026-07-01 08:30:00', 108),
    (1019, '2026-08-15 14:45:00', 108);
    
    
    -- ============================================
    -- INSERT PURCHASE ITEMS
    -- ============================================
    
    INSERT INTO purchase_item
    (purchase_item_id, purchase_id, product_name, quantity, total_amount_paid)
    VALUES
    
    -- Customer 101
    (1, 1001, 'Laptop', 1, 65000.00),
    (2, 1001, 'Mouse', 1, 1200.00),
    (3, 1001, 'Keyboard', 1, 2500.00),
    
    (4, 1002, 'Phone', 1, 30000.00),
    (5, 1002, 'Earphones', 1, 2500.00),
    
    (6, 1003, 'Laptop', 1, 70000.00),
    (7, 1003, 'Phone', 1, 32000.00),
    (8, 1003, 'Mouse', 2, 2400.00),
    
    
    -- Customer 102
    (9, 1004, 'Laptop', 1, 60000.00),
    (10, 1004, 'Mouse', 1, 1000.00),
    
    (11, 1005, 'Phone', 1, 28000.00),
    (12, 1005, 'Keyboard', 1, 2200.00),
    
    (13, 1006, 'Laptop', 1, 68000.00),
    (14, 1006, 'Phone', 1, 31000.00),
    
    
    -- Customer 103
    (15, 1007, 'Laptop', 1, 62000.00),
    (16, 1007, 'Keyboard', 1, 2300.00),
    
    (17, 1008, 'Phone', 1, 29000.00),
    (18, 1008, 'Mouse', 1, 1100.00),
    
    (19, 1009, 'Laptop', 1, 71000.00),
    (20, 1009, 'Phone', 1, 33000.00),
    (21, 1009, 'Earphones', 1, 3000.00),
    
    
    -- Customer 104
    (22, 1010, 'Laptop', 1, 64000.00),
    (23, 1010, 'Mouse', 1, 1200.00),
    
    (24, 1011, 'Phone', 1, 30000.00),
    (25, 1011, 'Earphones', 1, 2800.00),
    (26, 1011, 'Keyboard', 1, 2400.00),
    
    
    -- Customer 105
    (27, 1012, 'Laptop', 1, 61000.00),
    (28, 1012, 'Phone', 1, 29000.00),
    
    (29, 1013, 'Mouse', 1, 1300.00),
    (30, 1013, 'Keyboard', 1, 2500.00),
    
    
    -- Customer 106
    (31, 1014, 'Laptop', 1, 63000.00),
    (32, 1014, 'Phone', 1, 30000.00),
    
    (33, 1015, 'Laptop', 1, 67000.00),
    (34, 1015, 'Mouse', 1, 1200.00),
    (35, 1015, 'Earphones', 1, 2700.00),
    
    
    -- Customer 107
    (36, 1016, 'Phone', 1, 28000.00),
    (37, 1016, 'Mouse', 1, 1000.00),
    
    (38, 1017, 'Laptop', 1, 69000.00),
    (39, 1017, 'Keyboard', 1, 2600.00),
    (40, 1017, 'Phone', 1, 31000.00),
    
    
    -- Customer 108
    (41, 1018, 'Laptop', 1, 60000.00),
    (42, 1018, 'Earphones', 1, 2200.00),
    
    (43, 1019, 'Phone', 1, 32000.00),
    (44, 1019, 'Mouse', 1, 1200.00),
    (45, 1019, 'Keyboard', 1, 2500.00);

---

**Query #1**

    with pd as ( 
    select 
    p.purchase_id,
    p.purchase_time,
    pi.product_name,
    p.customer_id,
    pi.quantity,
    pi.total_amount_paid
    from purchase p
    inner join purchase_item pi
    on p.purchase_id = pi.purchase_id
    -- where p.customer_id = 101
    )
    
    , final as (
    select *
    , dense_rank() over(partition by customer_id order by purchase_time desc) as denserankk
    , rank() over(partition by customer_id order by purchase_time desc) as rankk
    , row_number() over(partition by customer_id order by purchase_time desc) as rownumb
    from pd
    )
    
    select *
    from final
    where denserankk = 1

| purchase_id | purchase_time       | product_name | customer_id | quantity | total_amount_paid | denserankk | rankk | rownumb |
| ----------- | ------------------- | ------------ | ----------- | -------- | ----------------- | ---------- | ----- | ------- |
| 1003        | 2026-08-26 11:15:00 | Laptop       | 101         | 1        | 70000.0           | 1          | 1     | 1       |
| 1003        | 2026-08-26 11:15:00 | Phone        | 101         | 1        | 32000.0           | 1          | 1     | 2       |
| 1003        | 2026-08-26 11:15:00 | Mouse        | 101         | 2        | 2400.0            | 1          | 1     | 3       |
| 1006        | 2026-08-20 18:30:00 | Laptop       | 102         | 1        | 68000.0           | 1          | 1     | 1       |
| 1006        | 2026-08-20 18:30:00 | Phone        | 102         | 1        | 31000.0           | 1          | 1     | 2       |
| 1009        | 2026-08-22 20:15:00 | Laptop       | 103         | 1        | 71000.0           | 1          | 1     | 1       |
| 1009        | 2026-08-22 20:15:00 | Phone        | 103         | 1        | 33000.0           | 1          | 1     | 2       |
| 1009        | 2026-08-22 20:15:00 | Earphones    | 103         | 1        | 3000.0            | 1          | 1     | 3       |
| 1011        | 2026-07-25 13:15:00 | Keyboard     | 104         | 1        | 2400.0            | 1          | 1     | 1       |
| 1011        | 2026-07-25 13:15:00 | Phone        | 104         | 1        | 30000.0           | 1          | 1     | 2       |
| 1011        | 2026-07-25 13:15:00 | Earphones    | 104         | 1        | 2800.0            | 1          | 1     | 3       |
| 1013        | 2026-08-10 19:20:00 | Mouse        | 105         | 1        | 1300.0            | 1          | 1     | 1       |
| 1013        | 2026-08-10 19:20:00 | Keyboard     | 105         | 1        | 2500.0            | 1          | 1     | 2       |
| 1015        | 2026-07-12 17:30:00 | Laptop       | 106         | 1        | 67000.0           | 1          | 1     | 1       |
| 1015        | 2026-07-12 17:30:00 | Mouse        | 106         | 1        | 1200.0            | 1          | 1     | 2       |
| 1015        | 2026-07-12 17:30:00 | Earphones    | 106         | 1        | 2700.0            | 1          | 1     | 3       |
| 1017        | 2026-08-05 21:00:00 | Phone        | 107         | 1        | 31000.0           | 1          | 1     | 1       |
| 1017        | 2026-08-05 21:00:00 | Laptop       | 107         | 1        | 69000.0           | 1          | 1     | 2       |
| 1017        | 2026-08-05 21:00:00 | Keyboard     | 107         | 1        | 2600.0            | 1          | 1     | 3       |
| 1019        | 2026-08-15 14:45:00 | Phone        | 108         | 1        | 32000.0           | 1          | 1     | 1       |
| 1019        | 2026-08-15 14:45:00 | Mouse        | 108         | 1        | 1200.0            | 1          | 1     | 2       |
| 1019        | 2026-08-15 14:45:00 | Keyboard     | 108         | 1        | 2500.0            | 1          | 1     | 3       |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
