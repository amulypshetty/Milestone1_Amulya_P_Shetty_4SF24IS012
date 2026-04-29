CREATE TABLE Users (
    user_id INTEGER PRIMARY KEY,
    user_name VARCHAR(100),
    user_email VARCHAR(100)
);

CREATE TABLE Movies (
    movie_id INTEGER PRIMARY KEY,
    movie_name VARCHAR(100)
);

CREATE TABLE Theatres (
    theatre_id INTEGER PRIMARY KEY,
    theatre_name VARCHAR(100),
    theatre_location VARCHAR(100)
);

CREATE TABLE Shows (
    show_id INTEGER PRIMARY KEY,
    movie_id INTEGER,
    theatre_id INTEGER,
    show_time DATETIME,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (theatre_id) REFERENCES Theatres(theatre_id)
);

CREATE TABLE Bookings (
    booking_id INTEGER PRIMARY KEY,
    user_id INTEGER,
    show_id INTEGER,
    total_price DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (show_id) REFERENCES Shows(show_id)
);

CREATE TABLE Seats (
    seat_id INTEGER PRIMARY KEY,
    booking_id INTEGER,
    seat_number VARCHAR(10),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

CREATE TABLE Payments (
    payment_id INTEGER PRIMARY KEY,
    booking_id INTEGER,
    payment_status VARCHAR(20),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

