import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_river/models/todo_model.dart';
import 'package:post_river/providers/todo_provider.dart';

class TodoItem extends ConsumerWidget {
  const TodoItem({super.key, required this.todo});

  final TodoModel todo;
  _deleteTodo(id, WidgetRef ref) {
    ref.read(todoProvider.notifier).deleteTodo(id);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.deepPurpleAccent.shade200,
                  foregroundColor: Colors.white,
                  child: Text(todo.id.toString()),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Text(
                    todo.todo as String,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                _deleteTodo(todo.id, ref);
              },
              icon: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
