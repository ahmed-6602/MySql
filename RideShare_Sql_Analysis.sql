**Schema (MySQL v9)**

    -- =========================================
    -- CREATE DATABASE
    -- =========================================
    
    CREATE DATABASE rideshare_db;
    USE rideshare_db;
    
    
    -- =========================================
    -- USERS TABLE
    -- =========================================
    
    CREATE TABLE users (
        user_id INT PRIMARY KEY,
        user_type VARCHAR(10) NOT NULL,
        user_first_name VARCHAR(50),
        user_last_name VARCHAR(50),
        user_city_name VARCHAR(50),
        banned VARCHAR(3) NOT NULL
    );
    
    
    -- =========================================
    -- TRIPS TABLE
    -- =========================================
    
    CREATE TABLE trips (
        date_time DATETIME NOT NULL,
        trip_id INT PRIMARY KEY,
        client_id INT NOT NULL,
        driver_id INT NOT NULL,
        city_name VARCHAR(50),
        address_to VARCHAR(100),
        address_from VARCHAR(100),
        ride_status VARCHAR(30) NOT NULL,
    
        FOREIGN KEY (client_id) REFERENCES users(user_id),
        FOREIGN KEY (driver_id) REFERENCES users(user_id)
    );
    
    
    -- =========================================
    -- SAMPLE DATA - USERS
    -- =========================================
    
    INSERT INTO users
    (user_id, user_type, user_first_name, user_last_name, user_city_name, banned)
    VALUES
    (1, 'Client', 'Ahmed', 'Khan', 'Hyderabad', 'No'),
    (2, 'Client', 'Rahul', 'Sharma', 'Delhi', 'No'),
    (3, 'Client', 'Sara', 'Ali', 'Mumbai', 'Yes'),
    (4, 'Client', 'John', 'Smith', 'Bangalore', 'No'),
    
    (101, 'Driver', 'David', 'Brown', 'Hyderabad', 'No'),
    (102, 'Driver', 'Amit', 'Patel', 'Delhi', 'No'),
    (103, 'Driver', 'Robert', 'Lee', 'Mumbai', 'Yes'),
    (104, 'Driver', 'James', 'Wilson', 'Bangalore', 'No');
    
    
    -- =========================================
    -- SAMPLE DATA - TRIPS
    -- =========================================
    
    INSERT INTO trips
    (date_time, trip_id, client_id, driver_id, city_name,
     address_to, address_from, ride_status)
    VALUES
    
    -- 01 Jan 2022
    ('2022-01-01 08:30:00', 1001, 1, 101, 'Hyderabad',
     'Hitech City', 'Malakpet', 'Completed'),
    
    ('2022-01-01 09:15:00', 1002, 2, 102, 'Delhi',
     'Connaught Place', 'Rohini', 'Cancelled by Driver'),
    
    ('2022-01-01 10:00:00', 1003, 1, 101, 'Hyderabad',
     'Banjara Hills', 'Ameerpet', 'Cancelled by Client'),
    
    -- Banned client - should NOT be counted
    ('2022-01-01 11:00:00', 1004, 3, 101, 'Mumbai',
     'Andheri', 'Bandra', 'Cancelled by Client'),
    
    -- Banned driver - should NOT be counted
    ('2022-01-01 12:00:00', 1005, 1, 103, 'Mumbai',
     'Powai', 'Andheri', 'Cancelled by Driver'),
    
    
    -- 02 Jan 2022
    ('2022-01-02 08:00:00', 1006, 4, 104, 'Bangalore',
     'Whitefield', 'Koramangala', 'Completed'),
    
    ('2022-01-02 09:00:00', 1007, 2, 102, 'Delhi',
     'Dwarka', 'Saket', 'Cancelled by Driver'),
    
    ('2022-01-02 10:30:00', 1008, 4, 104, 'Bangalore',
     'Indiranagar', 'Yelahanka', 'Completed'),
    
    
    -- 03 Jan 2022
    ('2022-01-03 08:15:00', 1009, 1, 101, 'Hyderabad',
     'Secunderabad', 'Madhapur', 'Completed'),
    
    ('2022-01-03 09:45:00', 1010, 2, 102, 'Delhi',
     'Noida', 'Saket', 'Cancelled by Client'),
    
    ('2022-01-03 11:00:00', 1011, 4, 104, 'Bangalore',
     'MG Road', 'Electronic City', 'Cancelled by Driver'),
    
    
    -- 31 Jan 2022
    ('2022-01-31 08:00:00', 1012, 1, 101, 'Hyderabad',
     'Gachibowli', 'Koti', 'Completed'),
    
    ('2022-01-31 09:30:00', 1013, 2, 102, 'Delhi',
     'Karol Bagh', 'Lajpat Nagar', 'Cancelled by Client'),
    
    ('2022-01-31 10:45:00', 1014, 4, 104, 'Bangalore',
     'Marathahalli', 'Hebbal', 'Completed'),
    
    
    -- Outside date range - should NOT be counted
    ('2021-12-31 10:00:00', 1015, 1, 101, 'Hyderabad',
     'Ameerpet', 'Kukatpally', 'Cancelled by Client'),
    
    ('2022-02-01 10:00:00', 1016, 2, 102, 'Delhi',
     'Dwarka', 'Rohini', 'Cancelled by Driver');

---

**Query #1**

    select * 
    from users;

| user_id | user_type | user_first_name | user_last_name | user_city_name | banned |
| ------- | --------- | --------------- | -------------- | -------------- | ------ |
| 1       | Client    | Ahmed           | Khan           | Hyderabad      | No     |
| 2       | Client    | Rahul           | Sharma         | Delhi          | No     |
| 3       | Client    | Sara            | Ali            | Mumbai         | Yes    |
| 4       | Client    | John            | Smith          | Bangalore      | No     |
| 101     | Driver    | David           | Brown          | Hyderabad      | No     |
| 102     | Driver    | Amit            | Patel          | Delhi          | No     |
| 103     | Driver    | Robert          | Lee            | Mumbai         | Yes    |
| 104     | Driver    | James           | Wilson         | Bangalore      | No     |

---
**Query #2**

    select *
    from trips;

| date_time           | trip_id | client_id | driver_id | city_name | address_to      | address_from    | ride_status         |
| ------------------- | ------- | --------- | --------- | --------- | --------------- | --------------- | ------------------- |
| 2022-01-01 08:30:00 | 1001    | 1         | 101       | Hyderabad | Hitech City     | Malakpet        | Completed           |
| 2022-01-01 09:15:00 | 1002    | 2         | 102       | Delhi     | Connaught Place | Rohini          | Cancelled by Driver |
| 2022-01-01 10:00:00 | 1003    | 1         | 101       | Hyderabad | Banjara Hills   | Ameerpet        | Cancelled by Client |
| 2022-01-01 11:00:00 | 1004    | 3         | 101       | Mumbai    | Andheri         | Bandra          | Cancelled by Client |
| 2022-01-01 12:00:00 | 1005    | 1         | 103       | Mumbai    | Powai           | Andheri         | Cancelled by Driver |
| 2022-01-02 08:00:00 | 1006    | 4         | 104       | Bangalore | Whitefield      | Koramangala     | Completed           |
| 2022-01-02 09:00:00 | 1007    | 2         | 102       | Delhi     | Dwarka          | Saket           | Cancelled by Driver |
| 2022-01-02 10:30:00 | 1008    | 4         | 104       | Bangalore | Indiranagar     | Yelahanka       | Completed           |
| 2022-01-03 08:15:00 | 1009    | 1         | 101       | Hyderabad | Secunderabad    | Madhapur        | Completed           |
| 2022-01-03 09:45:00 | 1010    | 2         | 102       | Delhi     | Noida           | Saket           | Cancelled by Client |
| 2022-01-03 11:00:00 | 1011    | 4         | 104       | Bangalore | MG Road         | Electronic City | Cancelled by Driver |
| 2022-01-31 08:00:00 | 1012    | 1         | 101       | Hyderabad | Gachibowli      | Koti            | Completed           |
| 2022-01-31 09:30:00 | 1013    | 2         | 102       | Delhi     | Karol Bagh      | Lajpat Nagar    | Cancelled by Client |
| 2022-01-31 10:45:00 | 1014    | 4         | 104       | Bangalore | Marathahalli    | Hebbal          | Completed           |
| 2021-12-31 10:00:00 | 1015    | 1         | 101       | Hyderabad | Ameerpet        | Kukatpally      | Cancelled by Client |
| 2022-02-01 10:00:00 | 1016    | 2         | 102       | Delhi     | Dwarka          | Rohini          | Cancelled by Driver |

---
**Query #3**

    /* 
     Question1: Write a SQL query to find the daily cancellation rate of requests 
     made by unbanned users (both client and driver must be unbanned) between 
     1st Jan and 31st Jan, 2022.
    */
    
    -- clients cancellation rate
    select 
        -- u.user_id,
        -- u.user_type,
        u.user_first_name,
        -- u.banned,
        -- t.ride_status,
        -- t.date_time,
        -- t.driver_id as driver_id,
        sum(case when ride_status = 'Cancelled by Client' then 1 else 0 end) as cancel_count,
        sum(case when ride_status = 'Cancelled by Driver' then 0 else 1 end) as total_ride,
        sum(case when ride_status = 'Cancelled by Driver' then 1 else 0 end) *100 /sum(case when ride_status = 'Cancelled by Client' then 0 else 1 end) as cancellation_rate
        from users u
    -- client_id, driver_id
    inner join trips t 
        on u.user_id = t.client_id
        where u.banned = 'No'
    		-- and u.user_id = 1
    	     and cast(t.date_time as date) between '2022-01-01' and '2022-01-31'
    group by
       -- u.user_id,
     --  u.user_type,
        u.user_first_name
        -- u.banned,
        -- t.ride_status,
        -- t.date_time,
        -- t.driver_id
    
    union 
    
    -- driver cancellation rate
    select 
      -- u.user_id,
       -- u.user_type,
       u.user_first_name,
       -- u.banned,
       -- t.ride_status,
        -- t.date_time,
        -- t.driver_id as driver_id,
        sum(case when ride_status = 'Cancelled by Driver' then 1 else 0 end) as cancel_ride,
        sum(case when ride_status = 'Cancelled by Client' then 0 else 1 end) as total_ride,
        sum(case when ride_status = 'Cancelled by Driver' then 1 else 0 end)*100/sum(case when ride_status = 'Cancelled by Client' then 0 else 1 end) cancellation_rate
    
        
        from users u
    -- client_id, driver_id
    inner join trips t
        on u.user_id = t.driver_id
    where 
    -- u.user_id = 1 
    	u.banned = 'No'
        and cast(t.date_time as date) between '2022-01-01' and '2022-01-31'
    group by
        -- u.user_id,
       -- u.user_type,
        u.user_first_name ;

| user_first_name | cancel_count | total_ride | cancellation_rate |
| --------------- | ------------ | ---------- | ----------------- |
| Ahmed           | 1            | 4          | 25.0              |
| Rahul           | 2            | 2          | 100.0             |
| John            | 0            | 3          | 25.0              |
| David           | 0            | 3          | 0.0               |
| Amit            | 2            | 2          | 100.0             |
| James           | 1            | 4          | 25.0              |

---
**Query #4**

    -- u.banned,
        -- t.ride_status,
        -- t.date_time,
        -- t.driver_id; 
        
        -- Q2: Write a query to find the number of unbanned clients from Seattle that have more than 5 completed rides.
     -- banned - yes/no 
     -- client ride<5 
        select  
        u.user_id,
        u.user_type,
        -- u.banned,
       u.user_first_name, 
        u.user_city_name,
        
      	count(t.client_id) as total_ride
        
        -- user_id = client_id
        from users u
        -- we need to first find total rides of client 
        inner join trips t
        	on u.user_id = t.client_id
        where 
     		u.banned = 'No'
           and u.user_city_name = 'Hyderabad'
        group by
        u.user_id,
        u.user_type,
        u.user_first_name, 
        u.user_city_name
        
      having 
      total_ride > 5;

| user_id | user_type | user_first_name | user_city_name | total_ride |
| ------- | --------- | --------------- | -------------- | ---------- |
| 1       | Client    | Ahmed           | Hyderabad      | 6          |

---
**Query #5**

    -- Q3: Write a query to return the number of Client first rides by City. 
    -- A client first ride is the earliest completed ride for a client.
    -- user name, date_time,city name from trips, ride status
    select 
    t.client_id,
    min(date_time) as first_trip_date
    
    from users u
    
    inner join trips t
    	on u.user_id = t.client_id
        where 
    		ride_status = 'Completed'
     		
    group by 
    t.client_id
    
    -- gpt anwser
    /* SELECT
        first_rides.city_name,
        COUNT(*) AS first_ride_count
    FROM (
        SELECT
            t.client_id,
            MIN(t.date_time) AS first_trip_date
        FROM users u
        INNER JOIN trips t
            ON u.user_id = t.client_id
        WHERE t.ride_status = 'Completed'
        GROUP BY t.client_id
    ) first_dates
    INNER JOIN trips first_rides
        ON first_rides.client_id = first_dates.client_id
        AND first_rides.date_time = first_dates.first_trip_date
    GROUP BY
        first_rides.city_name; */

| client_id | first_trip_date     |
| --------- | ------------------- |
| 1         | 2022-01-01 08:30:00 |
| 4         | 2022-01-02 08:00:00 |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
