#!/usr/bin/python

from os.path import isfile

class View:
    def __init__(self):
        self.base_path = "/usr/htdocs/jobies/views/"

    # def print_header(self):
    #     print "Content-type: text/html\n\n"
        
    def get_view(self, file, data = {}, form_data={}, validation_data={}):
        full_path_to_view = self.base_path + str(file) + ".py"

        if isfile(full_path_to_view):

            # open file for reading
            file_handle = open(full_path_to_view, 'r')

            # loop through each line in the file
            for line in file_handle:
                print line
