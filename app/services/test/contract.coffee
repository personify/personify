path = require 'path'

module.exports  =

  name: "todos"
  goal: "keep track of todos"
  models:
    Todo:
      txt:  String
      done: Boolean
  archive:
    todos: 'Todo.Collection'
  views:
    index:
     route: '/'
     crud: 'todos'

  paths:
    root:     path.resolve __dirname + '.'
    app:      path.resolve __dirname + './app'
    models:   path.resolve __dirname + './app/models'
    services: path.resolve __dirname + './app/services'
    client:   path.resolve __dirname + './app/dashboard/client'
    server:   path.resolve __dirname + './app/dashboard/server'
    public:   path.resolve __dirname + './app/dashboard/public'
    npmBin:   path.resolve __dirname + './node_modules/.bin'
   