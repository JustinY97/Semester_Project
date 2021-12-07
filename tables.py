from flask_table import Table, Col

class recipeResults(Table):
    RecipeName = Col("Recipe Name")
    Servings = Col("Serves")
    Diet = Col('Dietary Restriction')
    Calories = Col('Calories')
    Cost = Col('Cost')
    Time = Col('Time To Make')

class IngredientResults(Table):
    IngredientName = Col("Ingredient Name")
    category = Col("Category")
    Diet = Col('Dietary Restriction')
    protein = Col('Calories')
    sodium = Col('Cost')
    calcium = Col('Time To Make')
    fat = Col("Fat")
    carbs = Col("Carbs")
    sugars = Col("Sugars")
    cholesterol = Col("Cholestrol")
    VitaminB6 = Col("Vitamin B6")
    VitaminC = Col("Vitamin C")
    VitaminD = Col("Vitamin D")
    calories = Col("Calories")
    ServingSize = Col("Serving Size")
    cost = Col("Cost")

class goalsTable(Table):
    Startline = Col("Start Date")
    Deadline = Col("End Date")
    progress = Col("Progress")