use CMSC508Project;
DELIMITER $$
create function NormDailyCal(height int, weight int, activity varchar(30), gender varchar(30), DOB date)
returns int deterministic begin
	declare BMR DECIMAL(9,3);
    declare Cal int;
    
	if (activity = 'No Activity') then
		set BMR = 1.2;
    elseif (activity = 'Slightly Active') then
		set BMR = 1.375;
    elseif (activity = 'Very Active') then
		set BMR = 1.6;
    end if;
    
    if(gender = 'male') then
    set Cal = ((((weight * 0.453592) * 10) + (6.25 * (height * 2.54)) - ((5 * Age(DOB))) + 5)) * BMR;
    elseif(gender = 'female') then
    set Cal = (((weight * 0.453592) * 10) + (6.25 * (height * 2.54)) - ((5 * Age(DOB)) - 161)) * BMR;
    end if;
    
    return (Cal);
end;
$$
DELIMITER ;

DELIMITER $$
create function WeeklyWeightGoal(startdate date, deadline date, amount int)
returns decimal(9,2) deterministic begin
	declare WeeklyGoal DECIMAL(9,2);
    declare weeks decimal(9,2);
    set weeks = datediff(deadline, startdate) / 7;
    set WeeklyGoal = amount / weeks;
    
    return (WeeklyGoal);
end;
$$
DELIMITER ;

DELIMITER $$
create function GoalDailyCal(WeeklyGoal decimal(9,2), DailyCal int, type varchar(20))
returns int deterministic begin
	declare GoalCal int;
	declare percent decimal(9,2);
    set percent = (WeeklyGoal * 2) / 10;
	
    if(type = 'loss') then
    set GoalCal = DailyCal - (DailyCal * percent);
    elseif(type = 'gain') then
    set GoalCal = DailyCal + (DailyCal * percent);
    end if;
    
    return (GoalCal);
end;
$$
DELIMITER ;

DELIMITER $$
create function Age(DOB date)
returns int deterministic begin
	declare age int;
	set age = floor((datediff(sysdate(), DOB))/365.25);
    return (age);
end;
    