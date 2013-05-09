#!/usr/bin/python

from views.helpers.form_builder import FormBuilder

class Register():

    def __init__(self, form_data={}, validation_data={}):
        self.form_data = form_data
        self.validation_data = validation_data
        print '<body> <h2>Register Page!</h2>'

        form = FormBuilder(self.validation_data, self.form_data)
        form.formHeader('/user/addUser')
        form.textInput('userName')
        form.select('type', [{"value" : 1, "display" : "Admin"}, {"value" : 2, "display" : "Employer"}, {"value" : 3, "display" : "Student"}]);
        form.textInput('password', True)
        form.submit()
        form.formCloser()

        print '</body> </html>'