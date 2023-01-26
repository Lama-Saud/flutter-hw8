class Todo {
  String id;
  String todoText;
  bool isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<Todo> todoList() {
    return [
      Todo(id: '01', todoText: 'Shop for groceries'),
      Todo(id: '02', todoText: 'Pack bag'),
      Todo(id: '03', todoText: 'Create project tag !! project'),
    ];
  }
}
