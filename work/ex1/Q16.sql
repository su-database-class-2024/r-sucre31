SELECT c.name AS category_name,
       COUNT(r.rental_id) AS rental_count,
       SUM(p.amount) AS total_sales
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON f.film_id = i.film_id
JOIN film_category f_c ON i.film_id = f_c.film_id
JOIN category c ON f_c.category_id = c.category_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.name
ORDER BY rental_count DESC;