paths = require '../../paths'
{resolve} = require 'path'
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
      #crud: 'todos'
      exe: -> console.log "client side!!!"
      template:  
        h1: "todos"
        input: 
          onchange: 'todos.push'
        list: 'todos'
  log:   console.log
  paths: paths resolve(__dirname + '/../')
