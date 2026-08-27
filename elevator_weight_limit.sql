**Schema (MySQL v9)**

    CREATE TABLE line (
        id INT NOT NULL PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        weight INT NOT NULL,
        turn INT UNIQUE NOT NULL,
        CHECK (weight > 0)
    );
    
    INSERT INTO line (id, name, weight, turn) VALUES
    (5, 'George Washington', 250, 1),
    (4, 'Tom Jefferson', 175, 5),
    (3, 'John Adams', 350, 2),
    (2, 'Thomas Jefferson', 500, 3),
    (1, 'James Elephant', 500, 6),
    (6, 'Will Johnliams', 200, 4);
    

---

**Query #1**

    -- order the data 
    --  maxium weight 1000 lbs
    -- find the last person without exdeeding
    
    -- step 1: set the turn in order
    with tmp as (
    select *, sum(weight) over(order by turn) as running_sum
    from line
    )
    
    , tmp2 as (
    select *, case when running_sum < 1000 then 9999 else running_sum end
    , row_number() over(order by case when running_sum < 1000 then 9999 else running_sum end) rnk
    from tmp
    ) 
    
    , tmp3 as (
    select *, sum(weight) over(order by turn) as running_sum2
    from tmp2
    where rnk <> 1
    order by turn
    )
    
    select name
    from tmp3
    where running_sum2 <= 1000
    order by turn desc
    limit 1

| name          |
| ------------- |
| Tom Jefferson |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
