

SELECT 
    f.title AS Film_Title,
    c.name AS Category_Name,
    COUNT(r.rental_id) AS Rental_Count
FROM 
    Category c
JOIN 
    Film_Category fc ON c.category_id = fc.category_id
JOIN 
    Film f ON fc.film_id = f.film_id
JOIN 
    Inventory i ON f.film_id = i.film_id
JOIN 
    Rental r ON i.inventory_id = r.inventory_id
WHERE 
    c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
GROUP BY 
    f.title, c.name
ORDER BY 
    c.name, f.title;
