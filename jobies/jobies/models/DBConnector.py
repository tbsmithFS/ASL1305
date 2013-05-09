#!/usr/bin/python

import mysql.connector


class DBConnector():

    def getConnection(self):
        self.cnx = mysql.connector.connect(host="127.0.0.1",
                                           port=8889,
                                           user="root",
                                           passwd="root",
                                           db="JobiesDB")
        return self.cnx



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
