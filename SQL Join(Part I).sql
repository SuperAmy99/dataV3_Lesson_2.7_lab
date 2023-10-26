-- SQL JOIN PARTI
USE sakila;
-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT 
    c.name AS category_name,
    COUNT(DISTINCT f.film_id) AS film_number
FROM
    category c
        JOIN
    film_category f ON f.category_id = c.category_id
GROUP BY category_name
ORDER BY film_number DESC;

-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT 
    s.first_name,
    s.last_name,
    SUM(p.amount) as payment_amount
FROM
    staff s
        JOIN
    payment p ON s.staff_id = p.staff_id
WHERE date_format(p.payment_date, '%Y-%m')='2005-08'
GROUP BY s.staff_id;


-- 3. Which actor has appeared in the most films?
SELECT 
    CONCAT(a.first_name,' ', a.last_name) AS actor,
    COUNT(DISTINCT fa.film_id) AS film_number
FROM
    actor a
        JOIN
    film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY film_number DESC
LIMIT 1;


-- 4. Most active customer (the customer that has rented the most number of films)
SELECT 
    CONCAT(customer.first_name, ' ',customer.last_name) AS name,
    COUNT(DISTINCT r.rental_id) AS film_number
FROM
    customer 
        JOIN
    rental r ON customer.customer_id = r.customer_id
GROUP BY customer.customer_id
ORDER BY film_number DESC
LIMIT 1;

-- 5. Display the first and last names, as well as the address, of each staff member.

SELECT 
    s.first_name,
    s.last_name,
    ad.address
FROM
    staff s
        JOIN
    address ad ON s.address_id = ad.address_id
ORDER BY s.first_name;


-- 6. List each film and the number of actors who are listed for that film.
SELECT 
    f.title, COUNT(fa.actor_id) as number_actor
FROM film f
        JOIN
    film_actor fa ON f.film_id = fa.film_id
GROUP BY f.title
ORDER BY number_actor DESC;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT 
    CONCAT(c.first_name,' ',c.last_name) AS name, SUM(p.amount) as total_amount
FROM customer c
JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name ASC;


-- 8. List the titles of films per category.
SELECT 
    fc.category_id,
    group_concat(f.title)
FROM
    film f
    JOIN
    film_category fc ON f.film_id = fc.film_id
GROUP BY fc.category_id
ORDER BY fc.category_id ;

