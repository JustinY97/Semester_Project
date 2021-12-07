
/*from sample data*/


/*.   old

insert into Users values('john123', 1990/10/24, 31, 'male', 200, 'none', 150);
insert into Users values('coolKid56', 1970,09/25 , 51, 'female', 160, 'none', 100);
insert into Users values('ashely101', 2000/4/10, 21, 'female', 140, 'vegan', 200);
insert into Users values('karen22', 1980/10/4, 41, 'female', 175, 'vegetarian', 175);
insert into Users values('bob36', 1950/9/28, 71, 'male', 120, 'none', 75);

*/


/*      changed 
INSERT INTO Meal VALUES ( 01, 'Spaghetti', '10/4/2021',800 );
INSERT INTO Meal VALUES ( 02, 'Chicken Pot Pie', '9/25/2021',404 );
INSERT INTO Meal VALUES ( 03, 'BBQ Chicken', '9/25/2021',400 );



*/
/*       deleted table
INSERT INTO Restriction VALUES ( 001, 'Peanut_Butter', 'Peanut');
INSERT INTO Restriction VALUES ( 002, 'Bread', 'Gluten');
INSERT INTO Restriction VALUES ( 003, 'Wheaties', 'Wheat');
INSERT INTO Restriction VALUES ( 004, 'Tilapia', 'Fish');
INSERT INTO Restriction VALUES ( 005, 'Meats', 'Vegetarian');
INSERT INTO Restriction VALUES ( 006, 'Meat & Dairy', 'Vegan');

*/


/*changed 
INSERT INTO Goal VALUES ( 001, 'Deficit', '20%', 'coolKid56', '1/1/2020', '1/1/2022', -20 , 1750 );
INSERT INTO Goal VALUES ( 002, 'Deficit', '10%', 'ashley101', '4/15/2021', '6/30/2022', -5 , 2000);
INSERT INTO Goal VALUES ( 003, 'Surplus', '62%', 'karen22', '6/22/2021', '12/22/2021', 10 , 2500 );
INSERT INTO Goal VALUES ( 004, 'Surplus', '85%', 'bob36', '11/1/2021', '11/8/2021', 20 , 3000);

*/
INSERT INTO Ingredient VALUES ( 'Ground Beef', 'Beef', 'none', 15, 57, 1, 17,0 ,0 , 30 , 15, 0, 1 , 216 , 85, 7);
INSERT INTO Ingredient VALUES ( 'Chicken Breast', 'Chicken', 'none' , 43, 104, 2, 5, 0 ,0 ,119 , 40, 0, 1 , 231 , 140, 10);
INSERT INTO Ingredient VALUES ( 'White Rice', 'Grain', 'vegan', 4.3, 2, 1, 0.4, 45 ,0.1 , 0 , 5, 0, 0 , 206, 158, 3);
INSERT INTO Ingredient VALUES ('Carrots', 'Vegetable', 'Vegetarian', .9, 69, 3, .2, 10, 4.7,0, 5, 9, 0, 41, 100, 2);
INSERT INTO Ingredient VALUES ('Peas', 'Vegetable', 'Vegetarian', 5.4, 3, 2.1, .2, 16, 5.9,0, 0, 24, 0, 41, 100, 2.5);
INSERT INTO Ingredient VALUES ('Onion', 'Vegetable', 'Vegetarian', 1.2, 4, 2, .1, 10, 4.7, 0, 0, 13, 0, 44, 110, 1.50);
INSERT INTO Ingredient VALUES ('Milk', 'Dairy', 'none', 8, 107, 30, 2.4, 12, 13, 12, 5, 0, 0, 103, 244, 3.50);
INSERT INTO Ingredient VALUES ('Nodles', 'Grain', 'none',5 , 6, 0, 1.1, 25, 4, 33, 0, 0, 0, 131, 100, 2);


INSERT INTO Recipe VALUES ('Chicken Pot Pie',4,'none',460,21,40);
INSERT INTO Recipe VALUES ('BBQ Chicken',4,'none',408,15,40);


/* Doesnt work due to recipe name being primary key 

INSERT INTO Recipe VALUES ('Spaghetti','Noodles', 200, 800, 10,'25 minutes');
INSERT INTO Recipe VALUES ('Spaghetti','Ground Beef',200 , 800, 6,'25 minutes');
INSERT INTO Recipe VALUES ('Spaghetti','Tomato Sauce', 200, 800, 6,'25 minutes');
*/

/* NEW VALUES FOR UPDATED TABLES */
insert into category values ('Shellfish');
insert into category values ('Dairy');
insert into category values ('Nut');
insert into category values ('Fish');
insert into category values ('Meat Substitute');
insert into category values ('Grain');
insert into category values ('Vegetable');
insert into category values ('Fruit');
insert into category values ('Pork');
insert into category values ('Beef');
insert into category values ('Egg');
insert into category values ('Chicken');
INSERT INTO category VALUES ('Sauce');

insert into Allergies values (1, 'john123', 'Nut');
insert into Allergies values (2, 'coolKid56', 'Shellfish');

