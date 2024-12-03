INSERT INTO User 
VALUES 
    (UUID(), "John", "Doe", "johndoe@gmail.com", "hasg930jkwwk8", "1234567890", "guest", DEFAULT),
    (UUID(), "Jane", "Rise", "janerise123@yahoo.com", "738hdknsip30", "", "host", DEFAULT),
    (UUID(), "Salman", "Saheed", "Saheedsalman234@example.com", "jdku38908u2nwms", "12345678", "admin", DEFAULT);


INSERT INTO Property
VALUES
    (UUID(), (SELECT user_id from User WHERE email = 'janerise123@yahoo.com'), "Biobaku", "Seaside Villa", "Akoka, Nigeria", "126.00", DEFAULT, DEFAULT);

INSERT INTO Booking
VALUES
    (UUID(), (SELECT property_id FROM Property WHERE name = 'Seaside Villa'),  (SELECT user_id from User WHERE email = 'johndoe@gmail.com'), '2024-12-15', '2024-12-20', 126.00, 'pending', DEFAULT);

INSERT INTO Payment
VALUES
    (UUID(), (SELECT booking_id FROM Booking WHERE user_id = (SELECT user_id from User WHERE email = 'johndoe@gmail.com') AND property_id = (SELECT property_id FROM Property WHERE name = 'Seaside Villa')), 126.00, DEFAULT, 'stripe');

INSERT INTO Review
VALUES
    (UUID(), (SELECT property_id FROM Property WHERE name = 'Seaside Villa'), (SELECT user_id from User WHERE email = 'johndoe@gmail.com'), 4, "It was a good stay, especially the balcony view", DEFAULT);

INSERT INTO Message
VALUES
    (UUID(), (SELECT user_id from User WHERE email = 'johndoe@gmail.com'), (SELECT user_id from User WHERE email = 'Saheedsalman234@example.com'), "i booked a Seaside villa with Jane Rise", DEFAULT);
