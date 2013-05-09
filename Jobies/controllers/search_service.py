#!/usr/bin/python
import json
import urllib2
from models.DBConnector import DBConnector


class SearchService():

    def __init__(self):
        dbconnector = DBConnector()
        self.cnx = dbconnector.getConnection()
        self.cursor = self.cnx.cursor()
        # print 4


    def search(self, searchTerm):
        # print searchTerm
        sql = ("SELECT Jobs.jobTitle, Jobs.description FROM Jobs WHERE Jobs.jobTitle like '%{}%'").format(searchTerm)

        self.cursor.execute(sql)
        
        allDefs = []
        for jobTitle, description in self.cursor:
            allDefs.append({
                 'jobTitle': jobTitle,
                 'description': description})
        
        # print json.dumps(allDefs)  
        return allDefs  

        self.cursor.close()
        self.cnx.close()