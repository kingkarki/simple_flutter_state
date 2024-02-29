import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:post_river/providers/post_provider.dart';
import 'package:post_river/providers/todo_provider.dart';
import 'package:post_river/screens/todo_item.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(todoProvider.notifier).loadTodos();
    });
    super.initState();
  }

  _addNewTodo() {
    ref.read(todoProvider.notifier).addTodo();
  }

  @override
  Widget build(BuildContext context) {
    TodoState state = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          IconButton(onPressed: _addNewTodo, icon: const Icon(Icons.add))
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(16),
        ),
        child: () {
          if (state is LoadedTodoState) {
            final todos = state.todos;
            return ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              clipBehavior: Clip.hardEdge,
              separatorBuilder: (context, index) => Container(
                height: 1,
                color: Colors.grey,
              ),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoItem(
                  todo: todos[index],
                );
              },
            );
          }
          if (state is LoadingTodoState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ErrorTodoState) {
            return const Center(
              child: Text(
                '😔😔😔 Something went wrong 😔😔😔',
                style: TextStyle(color: Colors.red, fontSize: 22),
              ),
            );
          }
        }(),
      ),
    );
  }
}
