/*Query 1 - Top Country with Rock Music Listeners? */
SELECT DISTINCT c.Country, COUNT(c.CustomerId) As NoOfMusicListener
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
WHERE t.GenreId = 1
GROUP BY c.Country
ORDER BY NoOfMusicListener DESC


/*Query 2 - Rock Band with Most Songs? */
SELECT ar.ArtistId, ar.Name, COUNT(t.TrackId) AS Songs
FROM Artist ar
JOIN Album al ON ar.ArtistId = al.ArtistId
JOIN Track t ON al.AlbumId = t.AlbumId
WHERE t.GenreId = 1
GROUP BY ar.ArtistId
ORDER BY Songs desc
LIMIT 10

/*Query 3 - Artist Who Earned The Most? */
SELECT ar.Name, SUM(il.UnitPrice * il.Quantity) AS TotalSpending
FROM Invoice i
JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId
JOIN Track t ON il.TrackId = t.TrackId
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId
GROUP BY ar.Name
Order BY TotalSpending DESC
LIMIT 5

/*Query 4 - Customer Who Spent the Most with U2 */
SELECT c.Country, COUNT(c.Country) AS NumberOfBuyer
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
JOIN Track t ON il.TrackId = t.TrackId
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId
WHERE ar.Name = 'U2'
GROUP BY c.Country
ORDER BY NumberOfBuyer DESC
LIMIT 10
