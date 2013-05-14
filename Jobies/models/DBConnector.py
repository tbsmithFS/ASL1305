#!/usr/bin/python

import MySQLdb


class DBConnector():
    def getConnection(self):
        self.db = web.database(host="127.0.0.1",
                                           port=8889,
                                           user="root",
                                           passwd="root",
                                           db="JobiesDB")
        return self.db