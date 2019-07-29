use sakila;

#Task 1:
#1. Return the categories (names) of the longest film. NOTE that there may be several "longest" films (i.e. with the same length), so you might need to return more than one category. Return the duration as well.

#ANS
select*from film_category;
select*from film;
select*from category;

select category.name, rental_duration, max(length) from film
join film_category using(film_id) 
join category using (category_id) 
group by category.name having max(length)=(select max(length) from film);

#2. Find the movies whose total number of actors is above the average. Return the movie names and its number of actors ordered by the title. IMPORTANT NOTE: this query should return many movies. Please write in your submission only the first TOP-10 results.

#Ans 
select*from film_actor;
select*from film;

select title, count(actor_id) from film join film_actor using(film_id)
group by title having count(actor_id)>10 limit 10; 

#(assumed average actor/film=10)

#3. Who is the customer who spent the most on rental movies? Return his/her customer id, first name and the amount spent.

#Ans
select*from customer;
select*from rental;
select*from payment; 


select customer_id, first_name, amount from customer
join rental on c.customer_id= r.customer_id 
join payment on c.customer_id= p.customer_id 
group by amount having max(customer_id) ;

#4. Give an interesting query of your own that is not already in the assignment. The query should involve at least two joins, HAVING clause and aggregation operation. Give the English explanation and the answer

#Display the film categories (names) where the average difference between the film replacement cost and the rental rate larger than 17? (question framed) 

#Ans:- 
select c.name, avg(b.replacement_cost) cost, avg(b.rental_rate) rate from film_category a inner join film b on a.film_id=b.film_id 
inner join category c on c.category_id=a.category_id group by a.category_id having cost-rate> 17;