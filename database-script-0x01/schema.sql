CREATE TABLE IF NOT EXIST User (
    user_id CHAR(36) PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(50),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE IF NOT EXIST Property (
    property_id CHAR(36) PRIMARY KEY,
    host_id CHAR(36),
    name VARCHAR(125) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL NOT NULL,
    created at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES User(user_id)
)

CREATE TABLE IF NOT EXIST Booking (
    booking_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36),
    user_id CHAR(36),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled'), NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
)

CREATE TABLE IF NOT EXIST Payment (
    payment_id CHAR(36) PRIMARY KEY,
    booking_id CHAR(36),
    amount DECIMAL NOT NULL,
    payment_date TIMESTAMP, DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
)

CREATE TABLE IF NOT EXIST Review (
    review_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36),
    user_id CHAR(36),
    rating INT  CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP, DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
)

CREATE TABLE IF NOT EXIST Message (
    message_id CHAR(36) PRIMARY KEY,
    sender_id CHAR(36),
    recipient_id CHAR(36),
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP, DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES User(user_id),
    FOREIGN KEY (recipient_id) REFERENCES User(user_id)
)
