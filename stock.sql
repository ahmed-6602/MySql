**Schema (MySQL v9)**

    CREATE TABLE inventory_1 (
    
      warehouse VARCHAR(20),
    
      sku VARCHAR(20),
    
      units INT
    
    );
    
    INSERT INTO inventory_1 VALUES
    
    ('ABC1','xyz',7), ('ABC1','def',4),
    
    ('ABC2','ine',6), ('ABC2','lig',90),
    
    ('ABC3','qng',5), ('ABC4','pth',46),
    
    ('ABC1','xyz',3), ('ABC2','ine',10);
    

---

**Query #1**

    -- Scenario: The operations team wants to know how much stock sits in each warehouse
    -- For each warehouse, what is the total number of units?
    
    
    select *
    from inventory_1;

| warehouse | sku | units |
| --------- | --- | ----- |
| ABC1      | xyz | 7     |
| ABC1      | def | 4     |
| ABC2      | ine | 6     |
| ABC2      | lig | 90    |
| ABC3      | qng | 5     |
| ABC4      | pth | 46    |
| ABC1      | xyz | 3     |
| ABC2      | ine | 10    |

---
**Query #2**

    select count(*) as total_stocks,sku,warehouse,sum(units)
    from inventory_1
    group by warehouse,sku;

| total_stocks | sku | warehouse | sum(units) |
| ------------ | --- | --------- | ---------- |
| 2            | xyz | ABC1      | 10         |
| 1            | def | ABC1      | 4          |
| 2            | ine | ABC2      | 16         |
| 1            | lig | ABC2      | 90         |
| 1            | qng | ABC3      | 5          |
| 1            | pth | ABC4      | 46         |

---
**Query #3**

    select warehouse,sum(units)
    from inventory_1
    group by warehouse;

| warehouse | sum(units) |
| --------- | ---------- |
| ABC1      | 14         |
| ABC2      | 106        |
| ABC3      | 5          |
| ABC4      | 46         |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
