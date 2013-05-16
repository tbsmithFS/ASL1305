#!/usr/bin/python

import cgi

from models.view import View
from controllers.register import Register
from models.DBConnector import DBConnector

class User():

    def get(self, query, data = {}):
        if 'action' not in query:
            action = 'home'
        else:
            action = query.getvalue('action')

        if action == 'home':
            self.home()
        elif action == 'login':
            self.login(data)
        elif action == 'register':
            self.register(data)
        
    def login(self):
        # login
        view_model = View()
        view_model.print_header()
        view_model.get_view('header')
        view_model.get_view('login', data)
        view_model.get_view('footer')
        
    def register(self):
        view_model = View()
        view_model.print_header()
        view_model.get_view('header')
        register = Register()
        view_model.get_view('footer')

    def addUser(self, name='', password='', typeId=''):
        db = DBConnector().getConnection()
        sql = "INSERT INTO Users (name,password,typeId) VALUES(%(name)s, %(password)s, %(typeId)s);"
        user_info = {
            'name': name,
            'password': password,
            'typeId': typeId
        }
    
        cursor = db.cursor()
        cursor.execute(sql, user_info)
        db.commit()
        cursor.close()
        db.close()
        print "Location: /home\n\n"

    def show_success_page(self):
        print 'Registration Was A Success! And So Are You!'


    # def updateUser(self, firstName='', lastName='', address='', city='', state='', phone='', zip=''):

    #   self.getConnection()

    #   sql = "UPDATE address \
    #          SET firstname=%(firstName)s, lastname=%(lastName)s, address=%(address)s, \
    #           city=%(city)s, state=%(state)s, zip=%(zip)s, phone=%(phone)s \
    #          WHERE id = 1182392"

    #   user_info = {
    #     'firstName': firstName,
    #     'lastName': lastName,
    #     'address': address,
    #     'city': city,
    #     'state': state,
    #     'zip': zip,
    #     'phone': phone
    #   }

    #   cursor = self.db.cursor()
    #   cursor.execute(sql, user_info)
    #   self.db.commit()
    #   cursor.close()
    #   self.db.close()    

    # def deleteUser(self, id=''):

    #   self.getConnection()

    #   sql = "DELETE FROM address WHERE id = 1182392"

    #   cursor = self.db.cursor()
    #   cursor.execute(sql)
    #   self.db.commit()
    #   cursor.close()
    #   self.db.close()