SELECT c.name AS category_name,
       AVG(DATE_PART('day', r.return_date - r.rental_date)) AS avg_rental_days
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON f.film_id = i.film_id
JOIN film_category f_c ON f.film_id = f_c.film_id
JOIN category c ON f_c.category_id = c.category_id
GROUP BY c.name
ORDER BY avg_rental_days DESC;