#!/usr/bin/python

class FormBuilder():

    def __init__(self, validation_data={}, form_data={}):
        self.validation_data = validation_data
        self.form_data = form_data

    def formHeader(self, action):
        print "<form action=\"" + action + "\" "
        print "enctype=\"multipart/form-data\" "
        print "method=\"post\">\n"

    def formCloser(self):
        print "</form>\n"

    def errorRow(self, name):
        print '<div class="error_row">'
        print self.validation_data[name]['error_message']
        print "</div>\n"

    def textInput(self, name, password=False):
        if password is True:
            type = 'password'
        else:
            type = 'text'

        if name in self.validation_data and \
           self.validation_data[name] and \
           self.validation_data[name]['has_error'] is True:
            self.errorRow(name)

        if name in self.form_data:
            current_value = self.form_data.getvalue(name)
        else:
            current_value = ""

        print "<div class=\"input_row\">\n"
        print "<div class=\"input_left\">\n"
        print name
        print "</div>"
        print "<div class=\"input_right\">\n"
        print "<input name=\"" + name + "\" "
        print "type=\"" + type + "\" value=\""
        print current_value + "\">"
        print "</div>\n"
        print "</div>\n"

    def radio(self, name, options):
        if name in self.validation_data and \
           self.validation_data[name] and \
           self.validation_data[name]['has_error'] is True:
            self.errorRow(name)
        print "<div class=\"input_row\">\n"
        print "<div class=\"input_left\">\n"
        print name
        print "</div>"
        print "<div class=\"input_right\">\n"
        for option in options:
            if name in self.form_data and \
               self.form_data.getvalue(name) == option:
                checked = 'checked'
            else:
                checked = ''
            print option
            print "<input name=\"" + name + "\" "
            print "type=\"radio\" " + checked + " "
            print "value=\"" + option + "\"/>\n"
        print "</div>\n"
        print "</div>\n"

    def select(self, name, values):
        if name in self.validation_data and \
            self.validation_data[name] and \
            self.validation_data[name]['has_error'] is True:
            self.errorRow(name)
        print "<label for=\"" + name + "\">\n"
        print name
        print "</label>"
        print "<select name=\"" + name + "\">"
        for value in values:
            print "<option value=\"" + str(value["value"]) + "\">" + str(value["display"]) + "</option>\n"
        print "</select>"

    def submit(self):
        print "<input type=\"submit\">\n"
