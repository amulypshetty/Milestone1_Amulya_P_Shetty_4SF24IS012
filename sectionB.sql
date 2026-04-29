CREATE TABLE Users (
    user_id INTEGER PRIMARY KEY,
    user_name VARCHAR(100),
    user_email VARCHAR(100),
    phone_number VARCHAR(15)
);

CREATE TABLE Theatres (
    theatre_id INTEGER PRIMARY KEY,
    theatre_name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE Screens (
    screen_id INTEGER PRIMARY KEY,
    theatre_id INTEGER,
    screen_name VARCHAR(50),
    FOREIGN KEY (theatre_id) REFERENCES Theatres(theatre_id)
);

CREATE TABLE Movies (
    movie_id INTEGER PRIMARY KEY,
    movie_name VARCHAR(100),
    genre VARCHAR(50),
    language VARCHAR(50),
    duration INTEGER
);

CREATE TABLE Shows (
    show_id INTEGER PRIMARY KEY,
    movie_id INTEGER,
    screen_id INTEGER,
    show_date DATE,
    show_time TIME,
    price DECIMAL(10,2),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (screen_id) REFERENCES Screens(screen_id)
);

CREATE TABLE Seat_Types (
    seat_type_id INTEGER PRIMARY KEY,
    seat_type_name VARCHAR(50)
);

CREATE TABLE Seats (
    seat_id INTEGER PRIMARY KEY,
    screen_id INTEGER,
    seat_number VARCHAR(10),
    seat_type_id INTEGER,
    FOREIGN KEY (screen_id) REFERENCES Screens(screen_id),
    FOREIGN KEY (seat_type_id) REFERENCES Seat_Types(seat_type_id)
);

CREATE TABLE Bookings (
    booking_id INTEGER PRIMARY KEY,
    user_id INTEGER,
    show_id INTEGER,
    booking_date DATE,
    total_price DECIMAL(10,2),
    payment_status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (show_id) REFERENCES Shows(show_id)
);

CREATE TABLE Booking_Seats (
    booking_seat_id INTEGER PRIMARY KEY,
    booking_id INTEGER,
    seat_id INTEGER,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
    FOREIGN KEY (seat_id) REFERENCES Seats(seat_id)
);
