from flask import Flask, render_template, flash, redirect, request, session
from flask_bootstrap import Bootstrap
from flask_moment import Moment
import pymysql.cursors
from tables import *
from forms import *


app = Flask(__name__)
app.config['SECRET_KEY'] = 'hard to guess string'

bootstrap = Bootstrap(app)
moment = Moment(app)

user = {"username": "abc", "password": "xyz"}



@app.route('/')
def home():
    return render_template('home.html')

@app.route('/recipes', methods=['GET', 'POST'])
def meal_picker():
    form = find_recipe()
    connection = pymysql.connect(host='cmsc508projectdb.colnzg9d22sk.us-east-2.rds.amazonaws.com',user='master', password='CMSC508Project', database='CMSC508Project', cursorclass=pymysql.cursors.DictCursor)

    if form.validate_on_submit():
        flash('Finding you recipes!')
        with connection:
            with connection.cursor() as cursor:
                # If filtering by diet requirements
                if form.search.data == 'Diet':
                    diet = str(form.recipe_focus.data)
                    if diet == 'None':
                        sql = str('SELECT * FROM Recipe')
                    else:
                        sql = str('SELECT * FROM Recipe WHERE Diet=\'' + diet + '\'')
                # If formatting by Recipe Name
                elif form.search.data == 'Recipe Name':
                    name = form.recipe_Name.data
                    sql = str('SELECT * FROM Recipe WHERE RecipeName LIKE \'%' + name + '\'%')

                # If filtering by Servings Size
                elif form.search.data == 'Servings':
                    servings = form.serving_size.data
                    sql = str('SELECT * FROM Recipe WHERE Servings > '  + servings)

                # If filtering by Calories
                elif form.search.data == 'Calories':
                    calories = form.calories.data
                    sql = 'SELECT * FROM Recipe WHERE Calories < '  + calories

                # If filtering by Cost
                else:
                    cost = form.cost.data
                    sql = 'SELECT * FROM Recipe WHERE Cost < ' + cost
                
                cursor.execute(sql)
                result = cursor.fetchall()
                if not result:
                        flash("No results found")
                else:
                    table = recipeResults(result)
                    table.border=True
                    return render_template('recipe_results.html', table=table)

    return render_template('recipe_picker.html', form=form)



@app.route('/ingredients', methods=['GET', 'POST'])
def ingredient_picker():
    form = find_ingredients()
    connection = pymysql.connect(host='cmsc508projectdb.colnzg9d22sk.us-east-2.rds.amazonaws.com',user='master', password='CMSC508Project', database='CMSC508Project', cursorclass=pymysql.cursors.DictCursor)

    if form.validate_on_submit():
        flash('Finding Ingredients!')
        with connection:
            with connection.cursor() as cursor:
                if form.search.data == 'Ingredient Name':
                    ingredientName = form.ingredientName.data
                    sql = str('SELECT * FROM Ingredient WHERE IngredientName LIKE \'%' + ingredientName + '%\'')
                elif form.search.data == 'Category':
                    category = form.category.data
                    sql = str('SELECT * FROM Ingredient WHERE category=\'' + category +'\'')
                cursor.execute(sql)
                result = cursor.fetchall()
                if not result:
                    flash("No Results")
                else:
                    table = IngredientResults(result)
                    table.border = True
                    return render_template('ingredient_results.html', table=table)

    return render_template('ingredient.html', form=form)

@app.route('/login', methods = ['POST', 'GET'])
def login():
    if(request.method == 'POST'):
        username = request.form.get('username')
        password = request.form.get('password')     
        if username == user['username'] and password == user['password']:
            
            session['user'] = username
            return redirect('/dashboard')
        
        return "<h1>Wrong username or password</h1>" 

    return render_template("login.html")

#Step -5(creating route for dashboard and logout)
@app.route('/dashboard')
def dashboard():
    if('user' in session and session['user'] == user['username']):
        return render_template('dashboard.html', user=user['username'])
    else:
        return redirect('/login')

#Step -6(creating route for logging out)
@app.route('/logout')
def logout():
    if('user' in session and session['user'] == user['username']):
        session.pop('user')         
        return redirect('/login')
    else:
        return redirect('/login')

@app.route('/create_account')
def createUser():
    form = create_user_form()
    return render_template('create_user.html', form=form)