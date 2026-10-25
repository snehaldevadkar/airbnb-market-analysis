-- Query 1: Total number of listings

SELECT COUNT(*) AS total_listings
FROM listings;

-- Query 2: Number of listings by borough

SELECT
    neighbourhood_group AS borough,
    COUNT(*) AS total_listings
FROM listings
GROUP BY neighbourhood_group
ORDER BY total_listings DESC;

-- Query 3: Average price by borough

SELECT
    neighbourhood_group AS borough,
    ROUND(AVG(price), 2) AS average_price
FROM listings
GROUP BY neighbourhood_group
ORDER BY average_price DESC;

-- Query 4: Average price by room type

SELECT
    room_type,
    COUNT(*) AS total_listings,
    ROUND(AVG(price), 2) AS average_price
FROM listings
GROUP BY room_type
ORDER BY average_price DESC;

-- Query 5: Average reviews by borough

SELECT
    neighbourhood_group AS borough,
    ROUND(AVG(number_of_reviews), 2) AS average_reviews
FROM listings
GROUP BY neighbourhood_group
ORDER BY average_reviews DESC;

-- Query 6: Average availability by borough

SELECT
    neighbourhood_group AS borough,
    ROUND(AVG(availability_365), 2) AS average_available_days
FROM listings
GROUP BY neighbourhood_group
ORDER BY average_available_days DESC;

-- Query 7: Top 10 neighbourhoods by number of listings

SELECT
    neighbourhood,
    COUNT(*) AS total_listings
FROM listings
GROUP BY neighbourhood
ORDER BY total_listings DESC
LIMIT 10;

-- Query 8: Top 10 hosts by number of listings

SELECT
    host_id,
    host_name,
    COUNT(*) AS total_listings
FROM listings
GROUP BY host_id, host_name
ORDER BY total_listings DESC
LIMIT 10;

-- Query 9: Review activity by room type

SELECT
    room_type,
    COUNT(*) AS total_listings,
    ROUND(AVG(number_of_reviews), 2) AS average_reviews,
    ROUND(AVG(reviews_per_month), 2) AS average_reviews_per_month
FROM listings
GROUP BY room_type
ORDER BY average_reviews DESC;

-- Query 10: Average price by borough and room type

SELECT
    neighbourhood_group AS borough,
    room_type,
    COUNT(*) AS total_listings,
    ROUND(AVG(price), 2) AS average_price
FROM listings
GROUP BY neighbourhood_group, room_type
ORDER BY borough, average_price DESC;

-- Query 11: Highest-priced neighbourhoods with at least 100 listings

SELECT
    neighbourhood,
    COUNT(*) AS total_listings,
    ROUND(AVG(price), 2) AS average_price
FROM listings
GROUP BY neighbourhood
HAVING COUNT(*) >= 100
ORDER BY average_price DESC
LIMIT 10;

-- Query 12: Hosts managing multiple listings

SELECT
    host_id,
    host_name,
    COUNT(*) AS total_listings,
    ROUND(AVG(price), 2) AS average_price
FROM listings
GROUP BY host_id, host_name
HAVING COUNT(*) >= 5
ORDER BY total_listings DESC
LIMIT 10;

-- Query 13: Affordable neighbourhoods with strong review activity

SELECT
    neighbourhood,
    COUNT(*) AS total_listings,
    ROUND(AVG(price), 2) AS average_price,
    ROUND(AVG(number_of_reviews), 2) AS average_reviews
FROM listings
GROUP BY neighbourhood
HAVING COUNT(*) >= 100
   AND AVG(price) <= 150
ORDER BY average_reviews DESC
LIMIT 10;