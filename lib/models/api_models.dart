// To parse this JSON data, do
//
//     final todo = todoFromJson(jsonString);

import 'dart:convert';

Todo todoFromJson(String str) => Todo.fromJson(json.decode(str));

class Todo {
  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  int userId;
  int id;
  String title;
  bool completed;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}

class Todos {
  List<Todo> todos;
  Todos({required this.todos});
  factory Todos.fromjson(List parsedjson) {
    List<Todo> todos = <Todo>[];
    todos = parsedjson.map((e) => Todo.fromJson(e)).toList();

    return Todos(todos: todos);
  }
}
