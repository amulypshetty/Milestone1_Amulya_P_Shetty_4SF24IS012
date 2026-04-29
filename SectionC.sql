SELECT u.user_name,m.movie_name,t.theatre_name,s.show_time,se.seat_number,b.booking_date
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Shows s ON b.show_id = s.show_id
JOIN Movies m ON s.movie_id = m.movie_id
JOIN Screens sc ON s.screen_id = sc.screen_id
JOIN Theatres t ON sc.theatre_id = t.theatre_id
JOIN Booking_Seats bs ON b.booking_id = bs.booking_id
JOIN Seats se ON bs.seat_id = se.seat_id
WHERE u.user_id = 1
AND b.booking_date BETWEEN '2026-04-01' AND '2026-04-30';


SELECT
m.movie_name,
COUNT(b.booking_id) AS total_bookings
FROM Bookings b
JOIN Shows s ON b.show_id = s.show_id
JOIN Movies m ON s.movie_id = m.movie_id
GROUP BY m.movie_name
ORDER BY total_bookings DESC
LIMIT 1; 


SELECT m.movie_name,s.show_time,
COUNT(bs.seat_id) AS booked_seats,
COUNT(se.seat_id) - COUNT(bs.seat_id) AS available_seats
FROM Shows s
JOIN Movies m ON s.movie_id = m.movie_id
JOIN Screens sc ON s.screen_id = sc.screen_id
JOIN Theatres t ON sc.theatre_id = t.theatre_id
JOIN Seats se ON sc.screen_id = se.screen_id
LEFT JOIN Booking_Seats bs ON se.seat_id = bs.seat_id
WHERE t.theatre_name = 'PVR'
AND s.show_date = '2026-04-29'
GROUP BY m.movie_name, s.show_time; 



START TRANSACTION;

SELECT *
FROM Seats
WHERE seat_id = 101
AND seat_id NOT IN (
SELECT seat_id FROM Booking_Seats
);

INSERT INTO Bookings
VALUES (1, 1, 1, '2026-04-29', 500, 'Paid');

INSERT INTO Booking_Seats
VALUES (1, 1, 101);

COMMIT;

ROLLBACK; 
