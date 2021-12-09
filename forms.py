from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, IntegerField, RadioField, SelectField
from wtforms.fields import  SelectMultipleField, PasswordField
from wtforms.validators import DataRequired

class find_recipe(FlaskForm):
    search = SelectField('Search by:', choices=[('Recipe Name', 'Recipe Name'), ('Diet', 'Diet'), ('Servings', 'Servings'), ('Calories', 'Calories'), ('Cost', 'Cost')], validators=[DataRequired()])
    recipe_Name = StringField('Recipe Name:')
    recipe_focus = SelectField('Diet Restrictions', choices=[('Vegan', 'Vegan'), ('Vegetarian', 'Vegetarian'), ('None', 'No Dietary Restrictions')])
    serving_size = IntegerField('Serves at least', default=0)
    calories = IntegerField('Max Calories', default=0)
    cost = IntegerField('Costs less than', default=0)
    submit = SubmitField('Submit')

class find_ingredients(FlaskForm):
    search = SelectField('Search by:', choices=[('Ingredient Name', 'Ingredient Name'), ('Category', 'Category')], validators=[DataRequired()])
    ingredientName = StringField('Ingredient Name:')
    category = SelectField('Select Category to look at:', choices=['Chicken', 'Beef', 'Dairy', 'Fruit', 'Grain', 'Nut', 'Sauce', 'Vegatable'])
    submit = SubmitField('Submit')

class customForm():
    sqlQuery = StringField('Enter your SQL Query', validators=[DataRequired()])
    submit = SubmitField('Submit')

class create_user_form(FlaskForm):
    name = StringField('Enter a unique Username', validators=[DataRequired()])
    password = PasswordField('Enter a password', validators=[DataRequired()])
    birthYear = IntegerField('What year were you born?', validators=[DataRequired()])
    birthMonth = IntegerField('What month were you born?', validators=[DataRequired()])
    birthDay = IntegerField('What day of the month were you born?',validators=[DataRequired()])
    gender = RadioField('What is your gender', choices=[('male', 'Male'),('female','Female')], validators=[DataRequired()])
    weight = IntegerField("Enter your weight", validators=[DataRequired()])
    height = IntegerField("How tall are you in inches", validators=[DataRequired()])
    activity = SelectField('Pick the activity level that best describes you', choices=[('No Activity', 'No Activity'), ('Slightly Active','Slightly Active'), ('Very Active', 'Very Active')], validators=[DataRequired()])
    diet = SelectField('Are ther any dietary restrictions you have', choices=[('Vegan','Vegan'),('Vegetarian','Vegetarian'),('None', 'None')], default='None', validators=[DataRequired()])
    budget = IntegerField('What is your weekly food budget', validators=[DataRequired()])
    submit = SubmitField('Submit')