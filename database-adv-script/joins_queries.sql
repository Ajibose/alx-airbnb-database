SELECT booking_id, property_id, start_date, end_date, status, first_name, last_name, email, phone_number, role
FROM Booking INNER JOIN User
ON Booking.user_id = User.user_id;

SELECT name, description, location, pricepernight, rating, comment, user_id
FROM Property LEFT JOIN Review
ON Property.property_id = Review.property_id;

SELECT first_name, last_name, email, phone_number, role, booking_id, property_id
FROM User LEFT JOIN Booking
ON User.user_id = Booking.user_id

UNION

SELECT first_name, last_name, email, phone_number, role, booking_id, property_id
FROM User RIGHT JOIN Booking
ON User.user_id = Booking.user_id;
