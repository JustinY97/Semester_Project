from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, IntegerField, RadioField, SelectField
from wtforms.fields.core import Label, SelectMultipleField
from wtforms.fields.simple import PasswordField
from wtforms.validators import DataRequired
from wtforms.widgets.core import Select

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

class create_user_form(FlaskForm):
    name = StringField('Enter a unique Username', validators=[DataRequired()])
    birthYear = IntegerField('What year were you born?', validators=[DataRequired()])
    birthMonth = IntegerField('What month were you born?', validators=[DataRequired()])
    birthDay = IntegerField('What day of the month were you born?', validators=[DataRequired()])
    gender = RadioField('What is your gender', choices=[('Male', 'Male'),('Female','Female'),('Other','Other')])
    height = IntegerField("How tall are you in inches")
    activity = SelectField('Pick the activity level that best describes you', choices=[('No Activity', 'No Activity'), ('Slightly Acive','Slightly Active'),('Moderately Active', 'Moderatley Active'), ('Very Active', 'Very Active')])
    diet = SelectMultipleField('Are ther any dietary restrictions you have', choices=[('Vegan','Vegan'),('Vegetarian','Vegetarian')])
    budget = IntegerField('What is your weekly food budget')
    submit = SubmitField('Submit')