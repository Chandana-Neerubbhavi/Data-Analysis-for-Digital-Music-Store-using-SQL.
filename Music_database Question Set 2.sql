/* Question set 2 - Moderate */

/* Q1: Write query to return the email, first name, last name, & Genre of all rock Music Listeners.
Return your list ordered alphabatically by email starting with A. */

/* Method 1 */

SELECT DISTINCT email,first_name,last_name
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line on invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN(
           SELECT track_id FROM track
           JOIN genre ON track.genre_id = genre.genre_id
           WHERE genre.name LIKE 'Rock'
)
Order by email;

/* Q2: Lets's invite the artists who have written the music.
Write a query that returns the Artist name and total track count of the top 10 rock bands*/

SELECT artist.artist_id,artist.name ,COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY  artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;


/* Q3:Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first*/

SELECT name,milliseconds
FROM track
WHERE milliseconds > (
      SELECT AVG(milliseconds) AS avg_track_lenght
      FROM track)
ORDER BY milliseconds DESC;
