<h1>Project Description</h1>
<p>The database is designed to be used by anybody with a web browser or a phone application. Our database tracks recipes and ingredients and provides nutritional information about each and possible recipes for a given set of ingredients. This application will also help your weight goals whether it is to put on muscle mass or lose weight.

Calorie specific meals means the database keeps track of all of the nutritional values, whether it is looking for foods with a higher concentration of vitamin c or a gluten free specific food. 

The users of this database will include people of three spectrums, people who are trying to restrict or increase the amount of calories they intake, people who want to make a recipe for a certain price point and people who want to find nutritious recipes given certain foods. 

The user interface of the application will have options for the users in the way they want to use the application. The options are Calorie Tracker, Recipe Builder, Food budgeting.

The User interface will have a Recipe builder option and ask the user for what kinds of foods they would like to make. After inputting what foods they want, the application will return results of various recipes that can be made using those foods. It will have an option to list dietary restrictions and will exclude this from the results. 

Calorie tracker the user will enter a goal weight and deadline of how fast they want to achieve the desired weight. We will prescribe a daily calorie count based on the length of your goal and the amount you want to gain or lose. 

Food Budgeting, the user will type in the budget and the foods they need and it will return recipes or meals at or below that budget. 
</p>


<h1>Entity Sets:</h1>
  <ul>Allergies</ul>
  <ul>Category</ul>
  <ul>Goal</ul>
  <ul>Ingredient</ul> 
  <ul>Meal</ul>
  <ul>MealRecipes</ul> 
  <ul>Pantry</ul>
  <ul>Recipe</ul>
  <ul>RecipeIngredients</ul> 
  <ul>Users</ul>
<h1>The operations to perform are:</h1>
<ul>Enter the budget for amount of food you can afford</ul>
<ul>Enter the amount of pounds you need to be above or below</ul>
<ul>Enter the food you want to use and it will return recipes regarding that search</ul>
  
    
  <h1>20 Distinct Queries:</h1>
  
  <li>What can I make with Chicken? </li>
      
  <ol><b>SELECT RecipeName FROM RecipeIngredients WHERE IngredientName LIKE '%Chicken%'</b></ol>
  
  <li>What can I make under 500 Calories? </li>
  
  <ol><b>SELECT * FROM Recipe where Calories < 500</b></ol>  
  
  <li> What is lowest calorie vegetarian Recipe </li>
  
  <ol><b> select RecipeName from Recipe where Diet = 'Vegetarian' Order by Calories  asc limit 1 </b></ol>
  
  <li>Give me Vegetarian options that don’t have sodium over 400 mg per serving.</li>
  
  <ol><b>select Distinct RecipeName from RecipeIngredients natural join Ingredient where Diet ='Vegetarian'  group by RecipeName Having  sum(sodium) <400 </b></ol>
  
  <li>What recipes can I make that are under 40 dollars and have over 20 grams of protein</li>
  
  <ol><b>select distinct RecipeName from Recipe natural join RecipeIngredients natural join Ingredient group By RecipeName having Recipe.cost = 10 and sum(protein) >20 </b></ol>
  
  <li>What kind of recipes include steak and not pork</li>
  
  <ol><b>SELECT Distinct RecipeName FROM RecipeIngredients WHERE ((IngredientName LIKE '%Beef%') And (IngredientName Not LIKE '%Pork%'))</b></ol>
  
  <li>What kind of recipe names that include the word pasta are under 15 grams of fat</li>
  
  <ol><b>SELECT RecipeName FROM RecipeIngredients JOIN Ingredient ON RecipeIngredients.IngredientName = Ingredient.IngredientName WHERE Ingredient.fat < 15 AND RecipeName LIKE '%Pasta%' </b></ol>
  
  <li>Display Vegetarian Diet Recipes</li>
  
  <ol><b>SELECT * FROM VegetarianRecipes</b></ol> 
  
  <li>What recipes are under $20 and are vegetarian</li>
  
  <ol><b>SELECT RecipeName FROM RecipeIngredients JOIN Ingredient ON RecipeIngredients.IngredientName = Ingredient.IngredientName WHERE amount < 20 AND Ingredient.category = 'vegetarian'</b></ol>
    
  <li>What is the least amount of money I could spend in a day if I want to have 3 whole meals</li>
    
  <ol><b>
SELECT 
    SUM(s.meals) AS 'Cheapest Meal in a Day'
FROM
    (SELECT 
        cost AS meals
    FROM
        Recipe
    ORDER BY Cost
    LIMIT 0 , 3) s</b></ol> 
    
  <li>What would it cost if I ate BBQ Chicken every night for a week</li>
    
  <ol><b>SELECT Cost*7 as 'Cost of Dinner This week' from Recipe where RecipeName = 'BBQ Chicken'</b></ol> 
    
  <li>What is the cheapest meal I can eat if I am a Vegan</li>
    
  <ol><b>SELECT RecipeName from Recipe where Diet ='Vegan' order by Cost Asc limit 1</b></ol> 
    
  <li>If I want Recipes that usebread as an ingredient, what are my options?</li>
    
  <ol><b>select RecipeName from RecipeIngredients Group by RecipeName having IngredientName Like 'Bread%'</b></ol> 
    
  <li>What would it cost if I went shopping and bought Ground Beef, Ragu? </li>
    
  <ol><b>select sum(Cost) as 'Shopping Total' from Ingredient where IngredientName like ('Ground Beef%' or 'Noodles%' or 'Ragu%' )</b></ol> 
    
  <li>What ingredients does user broski26 have in his pantry?</li>
    
  <ol><b>select Pantry.IngredientName from Pantry join Ingredient on Pantry.IngredientName = Ingredient.IngredientName Where username = 'broski26'</b></ol>   
    
  <li>what is the average amount of money a vegan would spend on a single meal</li>
    
  <ol><b>select avg(cost) from Recipe where RecipeName in (select RecipeName from VeganRecipes)</b></ol> 
    
  <li>What ingredients do I need to make Grilled Cheese</li>
    
  <ol><b>select IngredientName from RecipeIngredients  where RecipeName = 'Grilled Cheese'</b></ol> 
    
  <li>What Sauces are fat free?</li>
  
  <ol><b>select * from Ingredient where category = "Sauce" and fat = 0</b></ol> 
    
  <li>What does user Broski26 have thats in his pantry to use to make BBQ Chicken</li>
    
  <ol><b>select Distinct A.IngredientName from (select Pantry.IngredientName from Pantry join Ingredient on Pantry.IngredientName = Ingredient.IngredientName Where username = 'broski26')as A join (select IngredientName from RecipeIngredients where RecipeName = 'BBQ Chicken') as B 
</b></ol> 
    
  <li>Show what foods I need to avoid depending on what allergies I have</li>

  <ol><b>select Ingredient.category, Ingredient.IngredientName from Allergies join Ingredient where  Ingredient.category = Allergies.category </b></ol>   
    
    
    
    
    
<h1>Relational Schemas:</h1>
    <li> Allergies( RestrictionID(PK) INTEGER, username (FK) varchar(30) not null,category (FK)varchar(25) not null) </li>
    <li> category(category (PK) varchar(25)) </li>
    <li>Goal(GoalID  (PK) DECIMAL(9,0),username (FK) varchar(30) not null,Startline date not null,Deadline date not null,amount DECIMAL(9,0) not null, type varchar(20) not null, progress decimal(9,2) default 0)</li>
    <li> Ingredient(IngredientName (PK) varchar(25), category (FK) varchar(25) not null, Diet varchar(25) not null,protein  DECIMAL(9,2),sodium DECIMAL(9,2),calcium DECIMAL(9,2),fat DECIMAL(9,2) ,carbs DECIMAL(9,2), sugars DECIMAL(9,2) ,cholesterol DECIMAL(9,2) ,VitaminB6 int, VitaminC INTEGER,VitaminD INTEGER ,calories int ,ServingSize INTEGER,cost DECIMAL(9,0))</li>
    <li> Meal(MealID (PK) INTEGER, username (FK) varchar(30) not null,Date date not null, Diet varchar(25),calories  INTEGER default 0, cost DECIMAL(9,2) default 0) </li>
    <li> MealRecipes(ID (PK) INTEGER,MealID INTEGER not null,RecipeName varchar(25) not null </li>
    <li> Pantry(PantryID (PK) INTEGER, username (FK) varchar(30) not null,IngredientName (FK)varchar(25) not null,amount int not null) </li>
    <li>Recipe(RecipeName (PL)varchar(25), Servings INTEGER not null,Diet varchar(25) not null,Calories INTEGER default 0,Cost DECIMAL(9,2) default 0,Time INTEGER, </li>
    <li> RecipeIngredients(ID (PK) int,RecipeName (FK)varchar(25) not null, IngredientName (FK) varchar(25) not null, amount int not null) </li>
    <li> Users(username (PK) varchar(30),DOB date not null,gender varchar(25) not null, weight INTEGER not null,height INTEGER not null, activity varchar(30) not null,Diet varchar(25) not null, Weeklybudget DECIMAL(9,2))</li>
  
<h1>Functional Dependencies:</h1>
<ul>
  <li>User(Username, password, DOB, gender, weight, height, activity, Diet, budget)<br />Username -> password, DOB, gender, weight, height, activity, Diet, budget <br /></li>
     
  <li>Allergies(AllergyID, username, category)<br />AllergyID -> username, category</li>
     
  <li>Goal(GoalID, username, progress, Deadline, Startline, amount, type, amount)<br />GoalID -> username, Type, progress, Deadline, Startline, amount<br />GoalID,username -> progress<br /></li>
      
  <li>Ingredient(IngredientName, category, Diet, protein, sodium, calcium, sugars, fat, carbs, cholesterol, Vitamin B6, Vitamin C, Vitamin D, Serving Size, calories, cost)<br />IngredientName -> protein, sodium, sugars, fat, carbs, calcium, cholesterol, Vitamin B6, Vitamin C, Vitamin D, Serving Size, calories, category, cost</li>
     
  <li>Meal(MealID, username, date, Calories(), Cost(), Diet)<br />MealID -> username, Diet, date, Calories(), Cost()<br /> MealID -> Diet,Calories(), Cost()<br /></li>
      
  <li>Recipe(RecipeName, Servings, Calories(), Cost(), Time)<br />RecipeName -> Servings, Calories(), Cost(), Time, Diet<br />RecipeName -> Calories(), Cost()<br /></li>

  <li>Pantry(PantryID, username, IngredientName, amount)<br />PantryID -> username, IngredientName, amount<br /></li>
	
  <li>MealRecipes(MealRecipeID, MealID, RecipeName)<br />MealRecipeID -> MealID, RecipeName<br /></li>
	
  <li>RecipeIngredients(RecipeIngredientsID, RecipeName, IngredientName)<br />RecipeIngredientsID -> RecipeName, IngredientName<br /></li>
	
  <li>Category(Category)<br />Category -> Category<br /></li>
</ul>

<h1>BCNF Functional Dependencies:</h1>

<ul>
  <li>User(Username, DOB, age(), gender, weight, height, activity, Diet, Weeklybudget, DailyCal)<br />
    F = {Username -> password, DOB, gender, weight, height, activity, Diet, budget}<br />
    R1 = (Username, password, DOB, gender, weight, height, activity, Diet, budget)<br />
    Is in loseless BCNF because there are is only one functional dependency
  </li>
   
  <li>Allergies(AllergyID, username, category)<br />
    F = {AllergyID -> username, category}<br />
    R1 = (AllergyID, username, category)<br />
    Is in loseless BCNF because there are is only one functional dependency<br />
  </li>
    
  <li>Goal(GoalID, username, Type, progress, Deadline, Startline, amount)<br />
    F = {GoalID -> username, Type, progress, Deadline, Startline, amount; GoalID, username -> progress}<br />
    R1 = (GoalID, username, Type, progress, Deadline, Startline, amount)<br />
    R2 = (GoalID, username, progress)<br />
    Is in lossless BCNF because R1 INTERSECT R2 = GoalID, so GoalID is a superkey<br />
  </li>
    
  <li>Ingredient(IngredientName, category, Diet, protein, sodium, calcium, sugars, fat, carbs, cholesterol, Vitamin B6, Vitamin C, Vitamin D, Serving Size, calories, cost}<br />
   F = {IngredientName -> category, Diet, protein, sodium, calcium, sugars, fat, carbs, cholesterol, Vitamin B6, Vitamin C, Vitamin D, Serving Size, calories, cost)<br />
   R1 = (IngredientName, category, Diet, protein, sodium, calcium, sugars, fat, carbs, cholesterol, Vitamin B6, Vitamin C, Vitamin D, Serving Size, calories, cost)<br />
   Is in loseless BCNF because there are is only one functional dependency<br />
  </li>
  
  <li>Meal(MealID, username, date, Calories(), Cost(), Diet)<br />
   F = {MealID -> username, date, Calories(), Cost(), Diet; MealID -> Calories(), Cost(), Diet}<br />
   R1 = (MealID, username, date, Calories(), Cost(), Diet)<br />
   R2 = (MealID, Calories(), Cost(), Diet)<br />
   Is in lossless BCNF because R1 INTERSECT R2 = MealID, so MealID is a superkey<br /></li>
   
  <li>Recipe(RecipeName, Servings, Calories(), Cost(), Time)<br />
    F = {RecipeName -> Servings, Calories(), Cost(), Time, Diet; RecipeName -> Calories(), Cost()}<br />
    R1 = (RecipeName, Servings, Calories(), Cost(), Time, Diet)<br />
    R2 = (RecipeName, Calories(), Cost())<br />
    Is in lossless BCNF because R1 INTERSECT R2 = RecipeName, so RecipeName is a superkey<br /></li>
	
  <li>MealRecipes(MealRecipeID, MealID, RecipeName)<br />
    F = {MealRecipeID -> MealID, RecipeName}<br />
    R1 = (MealRecipeID, MealID, RecipeName)<br />
    Is in loseless BCNF because there are is only one functional dependency<br />
  </li>
	
  <li>RecipeIngredients(RecipeIngredientsID, RecipeName, IngredientName)<br />
    F = {RecipeIngredientsID -> RecipeName, IngredientName}<br />
    R1 = (RecipeIngredientsID, RecipeName, IngredientName)<br />
    Is in loseless BCNF because there are is only one functional dependency<br />
  </li>
	
  <li>Pantry(PantryID, username, IngredientName)<br />
    F = {PantryID -> username, IngredientName}<br />
    R1 = (PantryID, username, IngredientName)<br />
    Is in loseless BCNF because there are is only one functional dependency<br />
  </li>
	
  <li>Category(Category)<br />
    F = {Category -> Category}<br />
    R1 = (Category)<br />
    Is in loseless BCNF because there are is only one functional dependency<br />
  </li>
</ul>  

