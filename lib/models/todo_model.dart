class TodoModel {
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  TodoModel({this.id, this.todo, this.completed, this.userId});

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['todo'] = todo;
    data['completed'] = completed;
    data['userId'] = userId;
    return data;
  }
}

class TodoResult {
  List<TodoModel>? todos;
  int? total;
  int? skip;
  int? limit;

  TodoResult({this.todos, this.total, this.skip, this.limit});

  TodoResult.fromJson(Map<String, dynamic> json) {
    if (json['todos'] != null) {
      todos = <TodoModel>[];
      json['todos'].forEach((v) {
        todos!.add(TodoModel.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (todos != null) {
      data['todos'] = todos!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}
