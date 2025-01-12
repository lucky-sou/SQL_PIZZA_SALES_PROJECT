SELECT * FROM ola.booking;
-- Retrieve all successful bookings:
CREATE VIEW successful_bookings AS
    SELECT 
        *
    FROM
        ola.booking
    WHERE
        Booking_Status = 'success';
 #1 -- Retrieve all successful bookings:
  select* from successful_bookings;
  
  
-- Find the average ride distance for each vehicle type:
    CREATE VIEW ride_distance_for_each_vehicle AS
    SELECT 
        Vehicle_Type, AVG(Ride_Distance) AS avg_distance
    FROM
        booking
    GROUP BY Vehicle_Type;
    
    #2--Find the average ride distance for each vehicle type
    select*from ride_distance_for_each_vehicle;
   


--  Get the total number of cancelled rides by customers:
   create view  cancelled_rides_by_customers as
    select count(*) from ola.booking
    where Booking_Status ="Canceled by Customer";
    
    --#3 Get the total number of cancelled rides by customers:
    select * from cancelled_rides_by_customers;
     
     
--  List the top 5 customers who booked the highest number of rides:
	create view top_5_customers as
    select customer_id , count(booking_id) as total_ride from booking
    group by  Customer_ID
    order by total_ride desc limit 5 ;
    -- #4 List the top 5 customers who booked the highest number of rides:
     select*from top_5_customers;
     

--  Get the number of rides cancelled by drivers due to personal and car-related issues:
 create view cancelled_by_drivers_p_C_issues as
 select  count(*) from booking
where Canceled_Rides_by_Driver="personal & car related issue";
--#5  Get the number of rides cancelled by drivers due to personal and car-related issues:
 select * from cancelled_by_drivers_p_C_issues;
 

--  Find the maximum and minimum driver ratings for Prime Sedan bookings:
   create view max_min_deiver_rating as
   select MAX(Driver_Ratings) as max_rating,
   MIN(Driver_Ratings) as min_rating
   from booking where Vehicle_Type = "prime sedan";
    -- #6   Find the maximum and minimum driver ratings for Prime Sedan bookings:
   select * from max_min_deiver_rating;
   
   
   
--  Retrieve all rides where payment was made using UPI:
  create view UPI_Payment as
 select * from booking
 where Payment_Method = "UPI";
 
--  #7 Retrieve all rides where payment was made using UPI:
     select*from UPI_Payment;

 

--  Find the average customer rating per vehicle type:
 create view customer_rating_per_vehicle as
    select Vehicle_type,avg(customer_rating) as Avg_customer_rating from booking
    group by Vehicle_Type;
    -- #8  Find the average customer rating per vehicle type:
     select * from customer_rating_per_vehicle;

-- 9# Calculate the total booking value of rides completed successfully:
create view  total_successful_ride_value as
select sum(Booking_value) as total_successful_ride_value from booking
where Booking_Status="success";
--  9# Calculate the total booking value of rides completed successfully:
 select * from total_successful_ride_value;
 


--  #10 List all incomplete rides along with the reason:
 create view incomplete_rides_reason as
 select booking_id , incomplete_rides_reason
 from booking
 where Incomplete_Rides ="yes";
 
--   #10 List all incomplete rides along with the reason:
 select * from incomplete_rides_reason;
 
 
 
