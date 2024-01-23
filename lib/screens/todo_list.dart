import 'package:flutter/material.dart';
import 'package:rest_todo/screens/add_page.dart';

class TOdoListPage extends StatefulWidget {
  const TOdoListPage({super.key});

  @override
  State<TOdoListPage> createState() => _TOdoListPageState();
}

class _TOdoListPageState extends State<TOdoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Todo List'),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: navigateToAddPage, label: Text('Add Todo')),
    );
  }

  void navigateToAddPage() {
    final route = MaterialPageRoute(
      builder: (context) => AddTodoPage(),
    );
    Navigator.push(context, route);
  }
}
