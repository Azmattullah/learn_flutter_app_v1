import 'package:flutter/material.dart';
import 'package:learn_flutter_app/todo_01/model/todo.dart';

class CreateTodoWidget extends StatefulWidget {
  final Todo? todo;
  final ValueChanged<String> onSubmit;

  const CreateTodoWidget({
    Key? key,
    this.todo,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<CreateTodoWidget> createState() => _CreateTodoWidgetState();
}

class _CreateTodoWidgetState extends State<CreateTodoWidget> {
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller.text = widget.todo?.title ?? "";
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.todo != null;
    return AlertDialog(
      title: Text(isEditing ? 'Edit Todo' : 'Add Todo'),
      content: Form(
        child: TextFormField(
            autofocus: true,
            controller: controller,
            decoration: InputDecoration(hintText: 'Title'),
            validator: ((value) =>
                value != null && value.isEmpty ? 'Title is required' : null)),
      ),
    );
  }
}
