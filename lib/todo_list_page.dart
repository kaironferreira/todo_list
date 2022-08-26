import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TextEditingController _editingController = TextEditingController();
  List<String> _tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Tarefas"),
        ),
        body: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _editingController,
              ),
              SizedBox(
                height: 20,
              ),
              if (_tarefas.length == 0) Text("Não há tarefas no momento"),
              Expanded(
                child: ListView.builder(
                  itemCount: _tarefas.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.grey.shade300,
                      elevation: 2,
                      child: ListTile(
                        title: Text(_tarefas[index]),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                          ),
                          onPressed: () {
                            setState(() {
                              _tarefas.removeAt(index);
                            });
                          },
                        ),
                        contentPadding: EdgeInsets.all(10),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                if (_editingController.text.length > 0) {
                  setState(() {
                    _tarefas.add(_editingController.text);
                  });
                  _editingController.clear();
                }
              },
              child: Icon(Icons.save_outlined),
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                setState(() {
                  _tarefas = [];
                });
              },
              child: Icon(
                Icons.clear_all,
              ),
            ),
          ],
        ));
  }
}
