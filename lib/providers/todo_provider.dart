import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_river/models/todo_model.dart';
import 'package:post_river/services/todo_api.dart';
import 'dart:math';

final rnd = Random();

@immutable
class TodoState {}

class InitialTodoState extends TodoState {}

class LoadingTodoState extends TodoState {}

class LoadedTodoState extends TodoState {
  LoadedTodoState({required this.todos});
  final List<TodoModel> todos;
}

class ErrorTodoState extends TodoState {}

class TodoNotifier extends StateNotifier<TodoState> {
  TodoNotifier() : super(InitialTodoState());

  loadTodos() async {
    state = LoadingTodoState();
    final List<TodoModel> todos = await TodoApi().getTodos();
    if (todos.length > 1) {
      state = LoadedTodoState(todos: todos);
    } else {
      state = ErrorTodoState();
    }
  }

  void addTodo() {
    TodoModel todo = TodoModel(
      id: rnd.nextInt(99),
      completed: true,
      userId: 5,
      todo: 'Wash your hand',
    );
    final currentTodos = (state as LoadedTodoState).todos;
    state = LoadedTodoState(todos: [...currentTodos, todo]);
  }

  void deleteTodo(id) {
    final List<TodoModel> currentTodos = (state as LoadedTodoState).todos;
    final removed = currentTodos.where((todo) => todo.id != id).toList();
    state = LoadedTodoState(todos: removed);
  }
}

final todoProvider =
    StateNotifierProvider<TodoNotifier, TodoState>((ref) => TodoNotifier());
