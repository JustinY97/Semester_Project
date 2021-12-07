create database CMSC508Project;
use CMSC508Project;


create table Users(
	username varchar(30) primary key,
   	password varchar(30) not null,
	DOB	date not null,
	gender	varchar(25) not null,
   	weight int not null ,
   	height int not null,
   	activity varchar(30) not null,
   	Diet varchar(25) not null,
	Weeklybudget DECIMAL(9,2),
	CHECK (Weeklybudget >0),
    	check (weight > 0),
   	check (height > 0),
   	check (gender = 'female' or gender = 'male'),
   	check (activity = 'No Activity' or activity = 'Slightly Active' or activity = 'Very Active'),
   	check (DOB < sysdate()),
   	check (Diet = 'vegan' or Diet = 'vegetarian' or Diet = 'none')
);

create table Goal(
	GoalID  int primary key auto_increment,
	username varchar(30) not null,
	Startline date not null,
	Deadline date not null,
	amount DECIMAL(9,0) not null,
   	type varchar(20) not null,
    	progress decimal(9,2) default 0,
	foreign key(username) references Users(username) on delete cascade on update cascade,
    	check (amount >=0),
   	check (deadline > startline),
    	check (type = 'Gain' or type = 'Loss')
);
create table category(
	category varchar(25) primary key
);
create table Ingredient(
	IngredientName varchar(25) primary key,
	category varchar(25) not null,
    	Diet varchar(25) not null,
 	protein  DECIMAL(9,2),
 	sodium 	DECIMAL(9,2),
	calcium DECIMAL(9,2),
 	fat 	DECIMAL(9,2) ,
 	carbs 	DECIMAL(9,2) ,
	sugars 	DECIMAL(9,2) ,
 	cholesterol DECIMAL(9,2) ,
 	VitaminB6 int ,
 	VitaminC int ,
 	VitaminD int ,
	calories int ,
 	ServingSize int,
	cost DECIMAL(9,2),
    	foreign key (category) references category(category),
	CHECK (protein>=0),
 	CHECK (sodium>=0),
 	CHECK (sugars>=0),
 	CHECK (fat>=0),
	CHECK (calcium >=0),
 	CHECK (carbs>=0),
 	CHECK (cholesterol>=0),	
 	CHECK (VitaminB6>=0),	
 	CHECK (VitaminC>=0),
 	CHECK (VitaminD>=0),
 	CHECK (calories>=0),
 	CHECK (cost>=0),
    	check (Diet = 'Vegan' or Diet = 'Vegetarian' or Diet = 'None')
);

create table Pantry(
	PantryID int primary key auto_increment,
    	username varchar(30) not null,
    	IngredientName varchar(25) not null,
    	amount int not null,
    	foreign key (username) references Users(username) on delete cascade on update cascade,
    	foreign key (IngredientName) references Ingredient(IngredientName),
    	check (amount >= 0)
);
create table Recipe(
	RecipeName varchar(25) primary key,
	Servings int not null,
    	Diet varchar(25) not null,
	Calories int default 0,
	Cost DECIMAL(9,2) default 0,
	Time int,
	CHECK (Servings>0),
	check (Diet = 'Vegan' or Diet = 'vegetarian' or Diet = 'none')
);
create table Meal(
	MealID int primary key auto_increment,
    	username varchar(30) not null,
	Date date not null,
   	Diet varchar(25),
	calories  int default 0,
    	cost DECIMAL(9,2) default 0,
	foreign key (username) references Users(username) on delete cascade on update cascade
);

create table MealRecipes(
	ID int primary key auto_increment,
   	MealID int not null,
	RecipeName varchar(25) not null,
	foreign key (MealID) references Meal(MealID) on delete cascade,
	foreign key (RecipeName) references Recipe(RecipeName)
);

create table RecipeIngredients(
	ID int primary key auto_increment,
	RecipeName varchar(25) not null,
	IngredientName varchar(25) not null,
    	amount int not null,
	foreign key (RecipeName) references Recipe(RecipeName),
	foreign key (IngredientName) references Ingredient(IngredientName),
    	check (amount >= 0)
);
create table Allergies(
	RestrictionID int primary key auto_increment,
    	username varchar(30) not null,
	category varchar(25) not null,
	foreign key(category) references category(category),
    	foreign key (username) references Users(username) on delete cascade on update cascade
);
