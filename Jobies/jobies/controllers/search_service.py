#!/usr/bin/python
import json
import urllib2
from models.DBConnector import DBConnector


class SearchService():

    # def __init__(self):
    #     dbconnector = DBConnector()
    #     self.db = dbconnector.getConnection()
    #     self.cursor = self.db.cursor()
    #     # print 4


    def GET(self, searchTerm):
        print searchTerm
        # sql = ("SELECT Jobs.jobTitle, Jobs.description FROM Jobs WHERE Jobs.jobTitle like '%{}%'").format(searchTerm)
        results = db.select("Jobs.jobTitle, Jobs.description FROM Jobs")
        # self.cursor.execute(sql)
        
        # allDefs = []
        # for jobTitle, description in self.cursor:
        #     allDefs.append({
        #          'jobTitle': jobTitle,
        #          'description': description})
        
        # print json.dumps(allDefs)  
        # return allDefs  
        return results

        # self.cursor.close()
        # self.db.close()