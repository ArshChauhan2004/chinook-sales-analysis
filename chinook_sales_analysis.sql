USE chinook;

-- ============================================
-- Chinook Sales Analysis Queries
-- ============================================

-- Count Total Number of Artists

SELECT COUNT(*) AS total_artists
FROM Artist;

-- Count Total Number of Tracks

SELECT COUNT(*) AS total_tracks
FROM Track;

-- Count Total Number of Genres

SELECT COUNT(*) AS total_genres
FROM Genre;

-- Preview Sample Tracks

SELECT *
FROM Track
LIMIT 10;

-- Number of Tracks per Genre

SELECT g.Name AS genre_name, COUNT(t.TrackId) AS total_tracks
FROM Genre g
INNER JOIN Track t ON g.GenreId = t.GenreId
GROUP BY g.Name 
ORDER BY total_tracks DESC;

-- Top 5 Most Expensive Tracks

SELECT Name, UnitPrice
FROM Track
ORDER BY UnitPrice DESC
LIMIT 5;

-- Average Track Price

SELECT ROUND(AVG(UnitPrice),2) AS avg_track_price
FROM Track;

-- Total Revenue Generated

SELECT ROUND(SUM(UnitPrice * Quantity),2) AS total_revenue
FROM InvoiceLine;

-- Revenue per Genre

SELECT g.Name AS genre_name, ROUND(SUM(il.UnitPrice * il.Quantity),2) AS revenue
FROM Genre g
INNER JOIN Track t ON g.GenreId = t.GenreId
INNER JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY g.Name 
ORDER BY revenue DESC;

-- Revenue by Country

SELECT BillingCountry, ROUND(SUM(Total),2) AS total_revenue
FROM Invoice
GROUP BY BillingCountry 
ORDER BY total_revenue DESC;

-- Count Total Number of Invoices

SELECT COUNT(*) AS total_invoices
FROM Invoice;

-- Average Invoice Amount

SELECT ROUND(AVG(Total),2) AS avg_invoice_amount
FROM Invoice;

-- Highest Invoice Amount

SELECT MAX(Total) AS highest_invoice
FROM Invoice;

-- Total Quantity Sold

SELECT SUM(Quantity) AS total_tracks_sold
FROM InvoiceLine;

-- Top 5 Best Selling Tracks

SELECT t.Name, SUM(il.Quantity) AS total_sold
FROM Track t
INNER JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY t.Name 
ORDER BY total_sold DESC
LIMIT 5;

-- Rank Tracks by Price

SELECT Name, UnitPrice,
RANK() OVER (ORDER BY UnitPrice DESC) AS price_rank
FROM Track;

-- Row Number for Tracks

SELECT Name, ROW_NUMBER() 
OVER (ORDER BY Name) AS row_num
FROM Track;

-- Tracks Longer Than Average

SELECT Name, Milliseconds
FROM Track
WHERE Milliseconds >
(SELECT AVG(Milliseconds) FROM Track);
      
-- Revenue by Year

SELECT YEAR(InvoiceDate) AS sales_year,
ROUND(SUM(Total),2) AS total_revenue
FROM Invoice
GROUP BY YEAR(InvoiceDate) 
ORDER BY sales_year;

-- Top 3 Countries by Revenue 

SELECT BillingCountry, ROUND(SUM(Total),2) AS revenue
FROM Invoice
GROUP BY BillingCountry
ORDER BY revenue DESC
LIMIT 3;