create view NormDailyCalView as (select Users.username, Users.DOB, Users.gender, Users.weight, Users.height, Users.activity, Users.Diet, Age(DOB) as 'Age', NormDailyCal(height, weight, activity, gender, DOB) as 'DailyCalorie' from Users);
select * from NormDailyCalView;
create view WeeklyWeightView as (select username, WeeklyWeightGoal(Startline, deadline, amount) as 'WeeklyGoal' from Goal);
create view GoalCalView as (select Goal.username, Goal.amount, WeeklyWeightView.WeeklyGoal, Goal.Startline, Goal.Deadline, Goal.type, Goal.progress, Users.weight, GoalDailyCal(WeeklyGoal, DailyCalorie, type) as 'DailyGoalCalorie'from WeeklyWeightView, NormDailyCalView, Goal, Users where WeeklyWeightView.username = NormDailyCalView.username AND WeeklyWeightView.username = Goal.username AND Users.username = Goal.username);
select * from GoalCalView;

create view VeganRecipes as select RecipeName from Recipe where Diet = 'Vegan';

create view VegetarianRecipes as select RecipeName from Recipe where ((Diet = 'Vegan') or (Diet = 'Vegetarian'));
