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
