use CMSC508Project;

DELIMITER $$
create trigger RecipeUpdate
After insert on RecipeIngredients for each row
begin 
	declare IngredientCost decimal(9,2);
    declare IngredientCal int;
    set IngredientCost = 0;
    set IngredientCal = 0;
    select cost into IngredientCost from Ingredient where new.IngredientName = Ingredient.IngredientName;
    select calories into IngredientCal from Ingredient where new.IngredientName = Ingredient.IngredientName;
	update Recipe
    set Recipe.Cost = Recipe.Cost + (IngredientCost * new.amount)
    where new.RecipeName = Recipe.RecipeName;
    update Recipe
    set Recipe.calories = Recipe.calories + (IngredientCal * new.amount)
    where new.RecipeName = Recipe.RecipeName;
End;
$$
DELIMITER ;

DELIMITER $$
create trigger MealUpdate
After insert on MealRecipes for each row
begin 
	declare RecipeCost decimal(9,2);
    declare RecipeCal int;
    declare RecipeDiet varchar(20);
    select cost into RecipeCost from Recipe where new.RecipeName = Recipe.RecipeName;
    select calories into RecipeCal from Recipe where new.RecipeName = Recipe.RecipeName;
	select Diet into RecipeDiet from Recipe where new.RecipeName = Recipe.RecipeName;
    
    update Meal
    set Meal.Diet = RecipeDiet
    where new.MealID = Meal.MealID;
    
	update Meal
    set Meal.Diet = RecipeDiet
    where new.MealID = Meal.MealID and RecipeDiet = 'Vegan' AND (Meal.Diet != 'None' or Meal.Diet != 'Vegetarian');
    
    update Meal
    set Meal.Diet = RecipeDiet
    where new.MealID = Meal.MealID and RecipeDiet = 'Vegetarian' AND Meal.Diet != 'None';
    
    update Meal
    set Meal.Diet = RecipeDiet
    where new.MealID = Meal.MealID and RecipeDiet = 'None';
    
	update Meal
    set Meal.Cost = Meal.Cost + RecipeCost, 
    Meal.calories = Meal.calories + RecipeCal
    where new.MealID = Meal.MealID;
End;
$$
DELIMITER ;

DELIMITER $$
create trigger Progress
after update on Users for each row
begin
    declare types varchar(20);
    
    select Goal.type into types from Goal where new.username = Goal.username;
    if(types = 'gain') then
    if(new.weight < old.weight) then
    update Goal
    set progress = progress - ((old.weight - new.weight) / Goal.amount) * 100 
    where new.username = Goal.username;
    else update Goal
    set progress = progress + ((new.weight - old.weight) / Goal.amount) * 100
    where new.username = Goal.username;
    end if;
    end if;
    if (types = 'loss') then
    if (new.weight > old.weight) then
	update Goal
    set progress = progress - ((new.weight - old.weight) / Goal.amount) * 100 
    where new.username = Goal.username;
    else update Goal
    set progress = progress + ((old.weight - new.weight) / Goal.amount) * 100
    where new.username = Goal.username;
    end if;
    end if;
    update Goal
    set progress =  100
    where new.username = Goal.username AND Goal.progress > 100;
    update Goal
    set progress =  0
    where new.username = Goal.username AND Goal.progress < 0;
end;
$$
DELIMITER ;

DELIMITER $$
create trigger MealPantryUpdate
before delete on Meal for each row
begin 
    update Pantry, RecipeIngredients, MealRecipes
    set Pantry.amount = Pantry.amount - RecipeIngredients.amount
    where old.username = Pantry.username and Pantry.IngredientName = RecipeIngredients.IngredientName and old.MealID = MealRecipes.MealID and MealRecipes.RecipeName = RecipeIngredients.RecipeName;
    
    delete from Pantry where Pantry.amount = 0 and old.username = Pantry.username;
End;
$$
DELIMITER ;


DELIMITER $$
create trigger PantryInsert
before insert on Pantry for each row
begin 
	if(new.amount < 1) then
    set new.amount = 1;
    end if;
End;
$$
DELIMITER ;
