WITH all_movies AS (
    SELECT film_id, title, rental_duration,
           NTILE(4) OVER (ORDER BY rental_duration) AS rental_quartile
    FROM film
),
family_movies AS (
    SELECT f.film_id, f.title, c.name AS category_name, f.rental_duration,
           CASE 
               WHEN am.rental_quartile = 1 THEN 'first_quarter'
               WHEN am.rental_quartile = 2 THEN 'second_quarter'
               WHEN am.rental_quartile = 3 THEN 'third_quarter'
               WHEN am.rental_quartile = 4 THEN 'final_quarter'
           END AS rental_length_category
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    JOIN all_movies am ON f.film_id = am.film_id
    WHERE c.name IN ('Children', 'Family', 'Animation', 'Music') -- تحديد الفئات العائلية
)
SELECT category_name AS Category,
       rental_length_category AS "Rental length category",
       COUNT(*) AS Count
FROM family_movies
GROUP BY category_name, rental_length_category
ORDER BY Category, "Rental length category";
