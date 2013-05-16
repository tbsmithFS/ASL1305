#!/usr/bin/python

import re

class FormValidator():

    def __init__(self):
        self.data = {}
        self.data['name'] = {}
        self.data['email'] = {}
        self.data['verifyemail'] = {}
        self.data['password'] = {}
        self.data['rating'] = {}
        self.data['favNumber'] = {}

    def validate(self, query):
        self.data['successful'] = True

        # name
        if 'name' not in query or \
           re.search('^[a-zA-Z ]+$', query.getvalue('name')) is None:
            self.data['successful'] = False
            self.data['name']['has_error'] = True
            self.data['name']['error_message'] = \
                "Name must contain only letters and spaces."

        # email
        if 'email' not in query or \
           re.search('^\w+@\w+\.\w+', query.getvalue('email')) is None:
            self.data['successful'] = False
            self.data['email']['has_error'] = True
            self.data['email']['error_message'] = \
                "Email must be like user@example.com."

        # verify email
        if 'verifyemail' not in query or \
           query.getvalue('email') != query.getvalue('verifyemail'):
            self.data['successful'] = False
            self.data['verifyemail']['has_error'] = True
            self.data['verifyemail']['error_message'] = \
                "Email addresses must match."

        # password
        if 'password' not in query or \
           len(query.getvalue('password')) < 8:
            self.data['successful'] = False
            self.data['password']['has_error'] = True
            self.data['password']['error_message'] = \
                "Password must be at least 8 characters long."

        # rating
        if 'rating' not in query:
            self.data['successful'] = False
            self.data['rating']['has_error'] = True
            self.data['rating']['error_message'] = "Rating must be set."

        # favNumber
        if re.search('^\d+$', query.getvalue('favNumber')) is None:
            self.data['successful'] = False
            self.data['favNumber']['has_error'] = True
            self.data['favNumber']['error_message'] = \
                "FavNumber must be an integer."

        return self.data
