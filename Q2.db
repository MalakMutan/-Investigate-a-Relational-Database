WITH all_movies AS (
    SELECT film_id, title, rental_duration,
           NTILE(4) OVER (ORDER BY rental_duration) AS standard_quartile
    FROM film
),
family_movies AS (
    SELECT f.title, c.name AS category_name, f.rental_duration, 
           am.standard_quartile
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    JOIN all_movies am ON f.film_id = am.film_id
    WHERE c.name IN ('Children', 'Family', 'Animation', 'Music') 
)
SELECT title, category_name AS name, rental_duration, standard_quartile
FROM family_movies
ORDER BY standard_quartile ASC, rental_duration ASC;
