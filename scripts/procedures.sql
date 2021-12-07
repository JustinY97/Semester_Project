use CMSC508Project;
create role Users;



DELIMITER $$
create procedure NewUser(username varchar(30), password varchar(30), DOB date, gender varchar(20), weight int, height int, activity varchar(30), Diet varchar(25), Weeklybudget int)
begin
	insert into Users values (username,password,DOB, gender, weight, height, activity, Diet, WeeklyBudget);
end; $$
DELIMITER ;


DELIMITER $$
create procedure NewGoal(username varchar(30), startline date, Deadline date, amount int, type varchar(30))
begin
	insert into Goal values (0, username, startline, Deadline, amount, type, 0, 0, 0);
end; $$
DELIMITER ;

DELIMITER $$
create procedure DeleteGoal(ID int)
begin
	delete from Goal where GoalID = ID;
end; $$
DELIMITER ;

DELIMITER $$
create procedure PantryInsert(username varchar(30), IngredientName varchar(30), amount int)
begin
	insert into Pantry values (0, username, IngredientName, amount);
end; $$
DELIMITER ;



DELIMITER $$
create procedure MealInsert(MealID int, Recipe varchar(30))
begin
	insert into MealRecipes values (0, MealID, Recipe);
end; $$
DELIMITER ;



DELIMITER $$
create procedure CreateMeal(username varchar(30), Dates date)
begin
	insert into Meal values (0, username, Dates, null, 0, 0);
end; $$
DELIMITER ;


DELIMITER $$
create procedure NewAllergy(username varchar(30), category varchar(20))
begin
	insert into Allergies values (0, username, category);
end; $$
DELIMITER ;


DELIMITER $$
create procedure DeleteMeal(username varchar(30), MealIDs int)
begin
	delete from Meal where Meal.MealID = MealIDs AND Meal.username = username;
end; $$
DELIMITER ;


DELIMITER $$
create procedure UpdateWeight(username varchar(30), weight int)
begin
	update Users
    set Users.weight = weight where Users.username = username;
end; $$
DELIMITER ;


Grant execute on procedure NewUser to Users;
Grant execute on procedure NewGoal to Users;
Grant execute on procedure DeleteGoal to Users;
Grant execute on procedure PantryInsert to Users;
Grant execute on procedure MealInsert to Users;
Grant execute on procedure CreateMeal to Users;
Grant execute on procedure NewAllergy to Users;
Grant execute on procedure DeleteMeal to Users;
Grant execute on procedure UpdateWeight to Users;
Grant select on NormDailyCalView to Users;
Grant select on GoalCalView to Users;
Grant select on Allergies to Users;
Grant select on MealRecipes to Users;
Grant select on Pantry to Users;
Grant select on Goal to Users;
Grant select on Recipe to Users;
Grant select on Meal to Users;
Grant select on RecipeIngredients to Users;
