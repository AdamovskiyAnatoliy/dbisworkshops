from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, BooleanField, validators


class LoginForm(FlaskForm):
    login = StringField('Email: ', validators=[
        validators.DataRequired('Required')])
    password = StringField('Password: ', validators=[
        validators.DataRequired('Required')])

    # remember_me = BooleanField('Remember me')
    submit = SubmitField('Sign in')
