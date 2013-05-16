#!/usr/bin/python

from models.view import View

class Home():
    def get(self, query):

        if 'action' not in query:
            action = 'home'
        else:
            action = query.getvalue('action')

        view_model = View()
        view_model.print_header()
        view_model.get_view("header")

        if action == 'home':
            view_model.get_view('home')
        elif action == 'login':
            view_model.get_view('login')
        elif action == 'register':
            view_model.get_view('register')

        view_model.get_view("footer")