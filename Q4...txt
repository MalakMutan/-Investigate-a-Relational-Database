SELECT 
    s.store_id,
    EXTRACT(YEAR FROM r.rental_date) AS year,
    EXTRACT(MONTH FROM r.rental_date) AS month,
    COUNT(*) AS rental_count
FROM 
    rental r
JOIN 
    staff sf ON r.staff_id = sf.staff_id
JOIN 
    store s ON sf.store_id = s.store_id
GROUP BY 
    s.store_id, year, month
ORDER BY 
    year DESC, month DESC, rental_count DESC;
