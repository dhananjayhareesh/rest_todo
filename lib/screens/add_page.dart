import 'package:flutter/material.dart';

import 'package:rest_todo/services/todo_services.dart';
import 'package:rest_todo/utils/snackbar_helper.dart';

class AddTodoPage extends StatefulWidget {
  final Map? todo;
  const AddTodoPage({
    super.key,
    this.todo,
  });

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    final todo = widget.todo;
    if (todo != null) {
      isEdit = true;
      final title = todo['title'];
      final description = todo['description'];
      titleController.text = title;
      descriptionController.text = description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(isEdit ? 'Edit Todo' : 'Add Todo'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: 'Title'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(hintText: 'Description'),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: isEdit ? updateData : submitData,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(isEdit ? 'Update' : 'Submit'),
              ))
        ],
      ),
    );
  }

  Future<void> updateData() async {
    //get data from form
    final todo = widget.todo;
    if (todo == null) {
      print('you cannot call update without todo data');
      return;
    }
    final id = todo['_id'];

    //submit update data to server
    final isSuccess = await TodoService.updateTodo(id, body);

    //show success or fail message on status
    if (isSuccess) {
      showSuccessMessage(context, message: 'Creation success');
    } else {
      showErrorMessage(context, message: 'Creation Failed');
    }
  }

  Future<void> submitData() async {
    //submit data to server

    final isSuccess = await TodoService.addTodo(body);

    //show success or fail message on status
    if (isSuccess) {
      titleController.text = '';
      descriptionController.text = '';
      showSuccessMessage(context, message: 'Creation success');
    } else {
      showErrorMessage(context, message: 'Creation Failed');
    }
  }

  Map get body {
    //Get the data from the form
    final title = titleController.text;
    final description = descriptionController.text;
    return {
      "title": title,
      "description": description,
      "is_completed": false,
    };
  }
}
