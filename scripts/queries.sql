SELECT RecipeName FROM RecipeIngredients JOIN Ingredient ON RecipeIngredients.IngredientName = Ingredient.IngredientName WHERE Ingredient.fat < 15 AND RecipeName LIKE '%Pasta%';
select Distinct A.IngredientName from (select Pantry.IngredientName from Pantry join Ingredient on Pantry.IngredientName = Ingredient.IngredientName Where username = 'broski26')as A join (select IngredientName from RecipeIngredients where RecipeName = 'BBQ Chicken') as B;
select Pantry.IngredientName from Pantry join Ingredient on Pantry.IngredientName = Ingredient.IngredientName Where username = 'broski26';
SELECT RecipeName FROM RecipeIngredients JOIN Ingredient ON RecipeIngredients.IngredientName = Ingredient.IngredientName WHERE amount < 20 AND Ingredient.category = 'vegetarian';
select sum(Cost) as 'Shopping Total' from Ingredient where IngredientName like ('Ground Beef%' or 'Noodles%' or 'Ragu%' );
select distinct RecipeName from Recipe natural join RecipeIngredients natural join Ingredient group By RecipeName having Recipe.cost = 10 and sum(protein) >20;
select Distinct RecipeName from RecipeIngredients natural join Ingredient where Diet ='Vegetarian' group by RecipeName Having sum(sodium) <400;
SELECT Distinct RecipeName FROM RecipeIngredients WHERE ((IngredientName LIKE '%Beef%') And (IngredientName Not LIKE '%Pork%'));
select RecipeName from Recipe where Diet = 'Vegetarian' Order by Calories asc limit 1;
SELECT RecipeName FROM RecipeIngredients WHERE IngredientName LIKE '%Chicken%';
SELECT * FROM Recipe where Calories < 500;
SELECT * FROM VegetarianRecipes;
SELECT SUM(s.meals) AS 'Cheapest Meal in a Day' FROM (SELECT cost AS meals FROM Recipe ORDER BY Cost LIMIT 0 , 3) s;
SELECT Cost*7 as 'Cost of Dinner This week' from Recipe where RecipeName = 'BBQ Chicken';
SELECT RecipeName from Recipe where Diet ='Vegan' order by Cost Asc limit 1;
select RecipeName from RecipeIngredients Group by RecipeName having IngredientName Like 'Bread%';
select avg(cost) from Recipe where RecipeName in (select RecipeName from VeganRecipes);
select IngredientName from RecipeIngredients where RecipeName = 'Grilled Cheese';
select * from Ingredient where category = "Sauce" and fat = 0;
select Ingredient.category, Ingredient.IngredientName from Allergies join Ingredient where Ingredient.category = Allergies.category;




