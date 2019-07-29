use sakila;
show tables;
#Task 1
#1. What are the names of all the countries in the databases which start with the letter "B" (sorted by their names)?

#Ans
select*from country;
select country from sakila.country where country Like  'B%' order by country; 

#2. Return the first names (sorted) of all the actors with the last name "berry".

#Ans
select*from actor;
select first_name from sakila.actor where last_name like 'berry%' order by first_name;

#Find all the films whose length is more than 184 (inclusive). Order the results by the length

#Ans
select*from film;
select title, length from sakila.film where length >=184 order by length, title ;

