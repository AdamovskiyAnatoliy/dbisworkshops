import random
import cx_Oracle
import pandas as pd


user_name = 'my_name'
password = 'my_name'
server = 'xe'


class User:

    def __init__(self):
        self.__db = cx_Oracle.connect(user_name, password, server)
        self.__cursor = self.__db.cursor()

    # def add_card(self, cardnumber, userlogin):
    #     sql = 'SELECT * FROM Card'
    #     table = pd.read_sql_query(sql, self.__db)
    #     print(table)
    #     self.__cursor.callproc('card_package.card_add_card', [cardnumber, userlogin])
    #     table = pd.read_sql_query(sql, self.__db)
    #     print(table)

    def login_user(self, user_login, user_password):
        res = self.__cursor.callfunc('user_package.login_user', cx_Oracle.NUMBER, [user_login, user_password])
        return res

#
# card = User()
#
# card.__enter__()
# print(card.login_user('log1', 'pass1'))
# card.__exit__()
