#!/usr/bin/python

import os, sys
sys.path.append(os.path.abspath(os.path.dirname(__file__)))


# WSGIPythonPath /path/to/Jobies/controllers

import json

# WEB.PY STUFF
import web

from controllers.search_service import SearchService

urls = (
  '/contact', 'contact',
  '/user', 'user',
  '/search', 'search',
  '/(.*)', 'home'
)

app = web.application(urls, globals(), autoreload=False)
application = app.wsgifunc()
web.config.debug = True
template_path = '/usr/htdocs/jobies/views/'
render = web.template.render('/usr/htdocs/jobies/views/')

allDefs = None;

class home:
  def GET(self, name=None):
    print 'home point'
    r = PageRenderer()
    return r.homePageRenderer()

class PageRenderer:
  def homePageRenderer(self):
    header = render.header()
    home = render.home(allDefs)
    footer = render.footer()
    form = render.index(header, home, footer)
    print 4
    return form

  # def searchPageRenderer(self, searchResults=None):
  #   print 1
  #   form = render.home(searchResults)
  #   r = PageRenderer()
  #   return r.homePageRenderer()
  #   print 2

    

class search:
  def GET(self):
    searchService = SearchService()
    allDefs = searchService.search(web.input("searchTerm"))
    print allDefs
    # if allDefs is not None:
    print 3
    # r = PageRenderer()
    # return r.searchPageRenderer(allDefs)


  # def GET(self, name=None):
    # form = web.template.frender(template_path + 'header.html')


# if 'page' in query and 'action' in query:
#   page = query.getvalue('page')
#   action = query.getvalue('action')
#   searchTerm = query.getvalue('searchTerm')
# else:
#   page = 'home'
#   action = 'search'
#   searchTerm = 'Web Developer'

# # print 2

# if page == 'home':
# def 
#   from controllers.home import Home
#   Home().get(query)

# elif page == 'user':
#   from controllers.user import User
#   user = User()

#   if 'action' not in query:
#     action = 'register'
#   else:
#     action = query.getvalue('action')

#   if action == 'register':
#     user.register()

#   elif action == 'login':
#     user.login(query)  

#   elif action == 'addUser':
#     user.addUser(query.getvalue("userName"),query.getvalue("password"),query.getvalue("type"));
#     # if validation_data['successful'] is True:
#     #   user.show_success_page()
#     # else:
#     #   user.show_register_form(query, validation_data)

#   else:
#     print "Didn't recognize action " + action

# elif page == 'search_service':
#   if action == 'search':
#     allDefs = searchService.search(query.getvalue("searchTerm"))
#     # MUST FIND A WAY TO SAY , PRINT THIS ONCE ALLDEFS RETURNED
#     print json.dumps(allDefs)    

#     print 3
#     # print query

# else:
#   # default if no page specified
#   from controllers.home import Home
#   Home().get(query)

# # def GET(self, allDefs=None):
# #     print json.dumps(allDefs)    
