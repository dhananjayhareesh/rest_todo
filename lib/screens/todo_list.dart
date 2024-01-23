import 'package:flutter/material.dart';

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
          onPressed: () {}, label: Text('Add Todo')),
    );
  }

  void navigateToAddPage() {}
}
