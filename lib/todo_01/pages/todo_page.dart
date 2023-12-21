import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learn_flutter_app/todo_01/database/todo_db.dart';
import 'package:learn_flutter_app/todo_01/model/todo.dart';
import 'package:learn_flutter_app/todo_01/widget/create_todo_widget.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  Future<List<Todo>>? futureTodos;
  final todoDB = TodoDB();

  @override
  void initState() {
    super.initState();
    fetchTodos();
  }

  void fetchTodos() {
    setState(() {
      futureTodos = todoDB.fetchAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => CreateTodoWidget(
              onSubmit: (title) async {
                await todoDB.create(title: title);
                if (!mounted) return;
                fetchTodos();
                Navigator.of(context).pop();
              },
            ),
          );
        },
      ),
      body: FutureBuilder<List<Todo>>(
        future: futureTodos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final todos = snapshot.data!;
            return todos.isEmpty
                ? const Center(
                    child: Text(
                      'No todos..',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      final subtitle = DateFormat('yyyy/MM/dd').format(
                        DateTime.parse(todo.updatedAt ?? todo.createdAt),
                      );
                      return ListTile(
                        title: Text(
                          todo.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(subtitle),
                        trailing: IconButton(
                          onPressed: () async {
                            await todoDB.delete(todo.id);
                            fetchTodos();
                          },
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => CreateTodoWidget(
                              onSubmit: (title) async {
                                await todoDB.update(
                                  id: todo.id,
                                  title: title,
                                );
                                fetchTodos();
                                if (!mounted) return;
                                Navigator.of(context).pop();
                              },
                            ),
                          );
                        },
                      );
                    },
                  );
          }
        },
      ),
    );
  }
}
