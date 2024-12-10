SELECT name, description, location, pricepernight 
FROM Property
WHERE property_id IN (
    SELECT property_id 
    FROM Review 
    GROUP BY property_id 
    HAVING AVG(rating) > 4
);

/*
SELECT first_name, last_name, email, phone_number, role
FROM User
WHERE user_id IN (
    SELECT user_id FROM Booking GROUP BY user_id HAVING COUNT(user_id) > 3
)
*/

SELECT first_name, last_name, email, phone_number, role
FROM User u
WHERE (
    SELECT COUNT(*) 
    FROM Booking 
    WHERE B.user_id = U.user_id
)
