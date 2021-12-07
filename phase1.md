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
  Ingredient
  Recipe
  Meals
  User 
  Goals
  Restrictions

<h1>The operations to perform are:</h1>
  Enter the budget for amount of food you can afford
  Enter the amount of calories you need to be above or below
  Enter the food you want to use and it will return recipes regarding that search
  
<h1>20 Distinct Queries:</h1>
  <ol>
    <li>What can I make with Chicken? </li>
    <li>Whar can I make under 500 Calories? </li>
    <li>Give me recipes for protein shakes that don’t include nut based products. (I.e. Set difference subtracting results with nuts) </li>
    <li>Give me soup options that don’t have sodium over 400 mg per serving.</li>
    <li>Given a $30 budget, can I make a Chicken pot pie casserole?<//li>
    <li>Give me pasta dishes that don’t include tomatoes and have less than 40 grams of carbs</li>
    <li>What recipes can I make that are under 40 dollars and have over 20 grams of protein</li>
    <li>What kind of recipes include steak and not pork</li>
    <li>What kind of recipes that include pasta are under 15 grams of fat</li>
    <li>What recipes have a greater amount of vitamin D than they do of vitamin C</li>
    <li>What recipes can be made in under 45 minutes using less than 30 dollars and less than 4 ingredients</li>
    <li>Display Keto Diet Recipes</li>
    <li>Are there atleast 5 Vegan Recipes that cost less than $10</li>
    <li>What recipes are under $20 and are vegetarian</li>
    <li>What ingredients have more than 18g of fat and less than 2g of carbs</li>
    <li>How many meals can I make with $50</li>
    <li>What ingredients are vegetarian but not keto</li>
    <li>How many recipies are ok for a Wheat Allergy</li>
    <li>What goals are deficets</li>
    <li>How many goals started after 1/1/2020</li>
  </ol>
    
<h1>Relational Schemas:</h1>
  <ul>
    <li><p>Recipes(__RecipeName(PK) STRING(64)__, IngredientName(FK) STRING(64), Serving Size INTEGER > 0, Calories() INTEGER > 0, Cost() INTEGER > 0, Time STRING(64))</p></li>
    <li>UsedIn(RecipeName(PK) STRING(64), IngredientName(PK) STRING(64))</li>
    <li>combineToMake(RecipeName(PK) STRING(64), MealName(PK) STRING(64))</li>
    <li>Ingredients(IngredientName(PK) STRING(64), type STRING(64), Protein INTEGER >= 0, Sodium INTEGER >= 0, Calcium INTEGER >= 0, Fat INTEGER >= 0, Carbs INTEGER >= 0, Sugars INTEGER >= 0, Vitamin A INTEGER >= 0, Vitamin B6 INTEGER >= 0, Vitamin C INTEGER >= 0, Vitamin D INTEGER >= 0, Cost INTEGER >= 0, Calories INTEGER >= 0)</li>
    <li>Meal(MealId(PK) INTEGER ,username(FK) STRING(64), RecipeName(FK) STRING(64), date STRING(64), Calories() INTEGER >= 0, Cost() INTEGER >= 0)</li>
    <li>User(username(PK) STRING(64), dateOfBirth STRING(64), age() INTEGER > 0, budget INTEGER > 0, gender STRING(64))</li>
    <li>Goal(GoalId(PK) INTEGER, username(FK) STRING(64), type STRING(64), progress STRING(64), deadline STRING(64), startline STRING(64), amount INTEGER, DailyCal() INTEGER >= 0)</li>
    <li>Restriction(RestrictionId(PK) INTEGER, type(FK) STRING(64), ingredientName(FK) STRING(64))</li>
  </ul>
  
<h1>Functional Dependencies:</h1>
<ul>
  <li>User(Username, DOB, age(), gender, budget)<br />Username -> DOB, age(), gender, budget <br />Dob -> age()</li>
     
  <li>Restriction(RestrictionID, IngredientName, Type)<br />Restriction ID -> IngredientName, Type</li>
     
  <li>Goal(GoalID, Type, progress(), Deadline, Startline, amount, DailyCal())<br />GoalID -> Type, progress(), Deadline, Startline, amount, DailyCal()<br />Deadline,Startline -> progress()<br />Deadline, Startline, amount -> DailyCal()</li>
      
  <li>Ingredient(IngredientName, protein, sodium, sugars, fat, carbs, Vitamin A, Vitamin B, Vitamin C, Vitamin D, Serving Size, calories, type)<br />IngredientName -> protein, sodium, sugars, fat, carbs, Vitamin A, Vitamin B, Vitamin C, Vitamin D, Serving Size, calories, type</li>
     
  <li>Meal(MealID, date, time, calories(), RecipeName)<br />MealID -> date, time, calories()<br />MealID, date, time, calories()->-> RecipeName</li>
      
  <li>Recipe(RecipeName, ServingSize, Calories(), Cost(), Time, IngredientName)<br />RecipeName -> ServingSize, Calories(), Cost(), Time)<br />RecipeName,ServingSize, Calories(), Cost(), Time ->-> IngredientName</li>
</ul>

<h1>BCNF Functional Dependencies:</h1>

<ul>
  <li>User(Username, DOB, age(), gender, budget)<br />
    F = {Username -> DOB, age(), gender, budget; Dob -> age()}<br />
    R1 = (Username, DOB, age(), gender)<br />R2 = (DOB, age())<br />
    Lossless-join decompistion is R1 INTERSECT R2 = none, since DOB is not a super key, so we need R2 = (Username, DOB, age())<br />
    R1 = (Username, DOB, age(), gender)<br />R2 = (Username, DOB, age())
  </li>
   
  <li>Restriction(RestrictionID, IngredientName, Type)<br />
    F = {Restriction ID -> IngredientName, Type}<br />
    R1 = (Restriction ID ,IngredientName, Type)<br />
    Is in loseless BCNF because there are is only one functional dependency
  </li>
    
  <li>Goal(GoalID, Type, progress(), Deadline, Startline, amount, DailyCal())<br />
    F = {GoalID -> Type, progress(), Deadline, Startline, amount, DailyCal(); Deadline,Startline -> progress(); Deadline, Startline, amount -> DailyCal()}>br />
    R1 = (GoalID, Type, progress(), Deadline, Startline, amount, DailyCal())<br />
    R2 = (Deadline,Startline, progress())<br />
    R3 = (Deadline, Startline, amount, DailyCal())<br />
    R1 satisifies conditions for BCNF but R2 and R3 don't, so decompose R2 into R21 = (Deadline, Startline, progress()) and R22 = (GoalID, Deadline, Startline, progress())<br />
    R1 = (GoalID(PK), Type, progress(), Deadline, Startline, amount, DailyCal())<br />
    R21 = (Deadline(PK), Startline, progress())<br />
    R22 = (GoalID(PK), Deadline, Startline, progress())<br />
    R3 = (Deadline(PK), Startline, amount, DailyCal())<br />
    R3 doesnt satisfy BCNF so we decompose into R31 = (Deadline, Startline, amount, DailyCal()) and R32 = (GoalID(PK), Deadline, Startline, DailyCal())<br />
    R1 = (GoalID(PK), Type, progress(), Deadline, Startline, amount, DailyCal())<br />
    R21 = (Deadline(PK), Startline, progress())<br />
    R22 = (GoalID(PK), Deadline, Startline, progress())<br />
    R31 = (Deadline, Startline, amount, DailyCal())<br />
    R32 = (GoalID(PK), Deadline, Startline, DailyCal())<br />
  </li>
    
  <li>Ingredient(IngredientName, protein, sodium, sugars, fat, carbs, Vitamin A, Vitamin B, Vitamin C, Vitamin D, Serving Size, calories, type}<br />
   F = {IngredientName -> protein, sodium, sugars, fat, carbs, Vitamin A, Vitamin B, Vitamin C, Vitamin D, Serving Size, calories, type)<br />
   R1 = (IngredientName, protein, sodium, sugars, fat, carbs, Vitamin A, Vitamin B, Vitamin C, Vitamin D, Serving Size, calories, type)<br />
   Is in loseless BCNF because there are is only one functional dependency<br />
  </li>
  
  <li>Meal(MealID, date, time, calories(), RecipeName)<br />
   F = {MealID -> date, time, calories(); MealID,date, time, calories()->-> RecipeName}<br />
   R1 = (MealID -> date, time, calories())<br />
   R2 = (MealID,date, time, calories()->-> RecipeName)<br />
   Lossless-join decompistion is R1 INTERSECT R2 = MealID, so MealID is a super Key and both MealID -> date, time, calories()  and MealID,date, time, calories()->-> RecipeName hold</li>
   
  <li>Recipe(RecipeName, ServingSize, Calories(), Cost(), Time, IngredientName)<br />
    F = {RecipeName -> ServingSize, Calories(), Cost(), Time; RecipeName,ServingSize, Calories(), Cost(), Time ->-> IngredientName}<br />
    R1 = (RecipeName, ServingSize, Calories(), Cost(), Time)<br />
    R2 = (RecipeName, ServingSize, Calories(), Cost(), Time, IngredientName)<br />
    Lossless-join decompistion is R1 INTERSECT R2 = RecipeName, so RecipeName is a super Key and both RecipeName -> ServingSize, Calories(), Cost(), Time and RecipeName, ServingSize, Calories(), Cost(), Time ->-> IngredientName hold
  </li>
</ul>  
<h1>Sample Data:</h1>

<h3>Recipe</h3>

|  RecipeName       | IngredientName    | ServingSize     | Calories()| Cost()  | Time        |
|---|---|---|---|---|--|
|  Chicken Pot Pie  |Chicken            | 404g / serving  | 758       | $15.00  | 40 minutes  |
|  Chicken Pot Pie  |Carrots            |404g / serving   | 758       | $15.00  | 40 minutes  |
|  Chicken Pot Pie  |Peas               |404g / serving   | 758       | $15.00  | 40 minutes  |
|  Chicken Pot Pie  |Onions             |404g / serving   | 758       | $15.00  | 40 minutes  |
|  Chicken Pot Pie  |Milk               |404g / serving   | 758       | $15.00  | 40 minutes  |
|  BBQ Chicken      |Chicken            | 100g / serving  | 650       | $10.00  | 30 minutes  |
|  BBQ Chicken      |Sweet Baby Ray's   | 100g / serving  | 650       | $10.00  | 30 minutes  |
|  Spaghetti        | Spaghetti Noodle  |200g / serving   | 800       | $6.00   | 25 minutes  |
|  Spaghetti        | Ground Beef       |200g / serving   | 800       | $6.00   | 25 minutes  |
|  Spaghetti        | Tomato Sauce      |200g / serving   | 800       | $6.00   | 25 minutes  |

  
<h3>Ingredient</h3>

|  Name           | Type    | Protein | Sodium  | Calcium | Fat   | Carbs | Sugars  | Vitamin A | Vitamin B6  | Vitamin C | Vitamin D | Calories  | ServingSize |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Chicken          | Meat   | 38g     | 89mg    | 0%      | 4.3g  | 0     | 0       | 30%       | 0%          | 0%        | 0%        | 335       | 120g        |
| Sweet Baby Rays  | Other  | 0g      | 290mg   | 0%      | 0g    | 18g   | 17g     | 1%        | 1%          | 1%        | 1%        | 70        | 36g         |
| Milk             | Dairy  | 8.1g    | 115mg   | 23%     | 4.8g  | 12g   | 12g     | 9.3%      | 0%          | 0.8%      | 0%        | 122       | 244g        |

*Sample Data from <a href="https://www.nutritionix.com">nutrionix.com</a>
  
    
<h3>Meal</h3>
  
|  MealId | RecipeName      |  Date/Time        | Calories()  | 
|---|---|---|---|
|  01     | Spaghetti       |10/4/2021 2:00 AM  | 800         |
|  02     | Chicken Pot Pie | 9/25/2021 4:45 PM | 404         |
|  02     | BBQ Chicken     | 9/25/2021 4:45 PM | 400         |
    
<h3>User</h3>
  
|  username   | dateofbirth | age() | budget  | gender  |
|---|---|---|---|---|
|  john123    | 10/24/1990  | 31    | $100    | Male    |
|  coolKid56  | 9/25/1970   | 51    | $125    | Female  |
|  ashley101  | 4/10/2000   | 21    | $75     | Female  |
|  karen22    | 10/4/1980   | 41    | $175    | Female  |
|  bob36      | 9/28/1950   | 71    | $150    | Male    |
|  gretchen75 | 5/11/1982   | 39    | $200    | Female  |
    
<h3>Goal</h3>
  
|GoalId | Type    | Progress()| Startline | Deadline  | Amount|DailyCalorieCount()|
|---|---|---|---|---|---|---|
|  001  | Deficit |   20%     |  1/1/2020 | 1/1/2022  | -20   | 1750              |
|  002  | Deficit |   10%     |  4/15/2021| 6/30/2022 | -5    | 2000              |
|  003  | Surplus |   62%     |  6/22/2021| 12/22/2021| 10    | 2500              |
|  004  | Surplus |   85%     |  11/1/2021| 11/8/2021 | 20    | 3000              |
  
<h3>Restriction</h3>
  
|  RestrictionId | IngredientName | Type |  
|---|---|---|
|  001  | Peanut_Butter |  Peanut
|  002  | Bread  | Gluten
|  003  | Wheaties | Wheat
|  004  | Tilapia | Fish
|  005  | Meats | Vegetarian
|  006  | Meats & Dairy | Vegan
    
    
