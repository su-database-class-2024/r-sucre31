SELECT co.country, 
       COUNT(DISTINCT cu.customer_id) AS customer_count, 
       SUM(p.amount) AS total_sales
FROM customer cu
JOIN address a ON cu.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
JOIN payment p ON cu.customer_id = p.customer_id
GROUP BY co.country
ORDER BY total_sales DESC;