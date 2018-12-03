from datetime import datetime, timedelta

from flask import Flask, render_template, request, make_response, flash, url_for, redirect
from wtf.form.login import LoginForm

from db import User

user_name = 'my_name'
password = 'my_name'
server = 'xe'

app = Flask(__name__)
app.secret_key = 'My_key'


@app.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if request.method == 'GET':
        log_in = request.cookies.get('cookie_name')
        if log_in is None:
            return render_template('login.html', form=form)
        return redirect('/success')

    if request.method == 'POST':

        if not form.validate():
            return render_template('login.html', form=form)
        else:
            user = User()
            res = user.login_user(request.form['login'], request.form['password'])
            if res:
                response = make_response(redirect('/success'))
                expires = datetime.now()
                expires += timedelta(days=60)
                response.set_cookie('cookie_name', request.form['login'], expires=expires)
                return response
            else:
                return render_template('login.html', form=form)


@app.route('/logout',  methods=['GET', 'POST'])
def logout():
    if request.method == 'GET':
        response = make_response(redirect('/login'))
        response.set_cookie('cookie_name', '', expires=0)
        return response


@app.route('/success')
def success():
    return 'Success Login'


app.run()
