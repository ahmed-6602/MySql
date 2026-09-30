**Schema (MySQL v9)**

    CREATE TABLE orders_y (
    
      order_id VARCHAR(10),
    
      customer_id VARCHAR(10),
    
      order_date DATE,
    
      product_id VARCHAR(20),
    
      quantity INT
    
    );
    
    INSERT INTO orders_y VALUES
    
    ('O1','C1','2000-01-15','P1',10),
    
    ('O2','C2','2002-01-01','P2',15),
    
    ('O3','C3','2002-04-01','P3',17),
    
    ('O4','C4','2003-04-01','P1',20),
    
    ('O5','C4','2006-01-01','P2',1),
    
    ('O6','C1','2006-05-01','P5',7),
    
    ('O7','C1','2006-06-01','P1',2),
    
    ('O8','C2','2002-08-15','P2',5);
    
    

---

**Query #1**

    -- Scenario: Product team wants yearly order volume. Table:
    -- Question: How many orders were placed in each year?
    select *
    from orders_y;

| order_id | customer_id | order_date | product_id | quantity |
| -------- | ----------- | ---------- | ---------- | -------- |
| O1       | C1          | 2000-01-15 | P1         | 10       |
| O2       | C2          | 2002-01-01 | P2         | 15       |
| O3       | C3          | 2002-04-01 | P3         | 17       |
| O4       | C4          | 2003-04-01 | P1         | 20       |
| O5       | C4          | 2006-01-01 | P2         | 1        |
| O6       | C1          | 2006-05-01 | P5         | 7        |
| O7       | C1          | 2006-06-01 | P1         | 2        |
| O8       | C2          | 2002-08-15 | P2         | 5        |

---
**Query #2**

    select year(order_date),count(distinct order_id) 
    from orders_y
    group by year(order_date);

| year(order_date) | count(distinct order_id) |
| ---------------- | ------------------------ |
| 2000             | 1                        |
| 2002             | 3                        |
| 2003             | 1                        |
| 2006             | 3                        |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
