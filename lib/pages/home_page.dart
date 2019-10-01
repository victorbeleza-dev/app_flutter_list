import 'package:flutter/material.dart';
import 'package:flutter_app/models/item.dart';

class HomePage extends StatefulWidget {
  var items = new List<Item>();
  HomePage(){
    items = [];
    items.add(Item(title: "Ir ao mercado", done: false));
    items.add(Item(title: "Trabalho", done: true));
    items.add(Item(title: "Relatório", done: true));
    items.add(Item(title: "Tcc primeira parte", done: false));
    items.add(Item(title: "Renovação", done: true));
  }
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var newTaskCtrl = TextEditingController();

  void add(){
    if(newTaskCtrl.text.isEmpty) return;
    setState(() {
      widget.items.add(
          Item(
              title: newTaskCtrl.text,
              done: false,
          ),
      );
      newTaskCtrl.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: newTaskCtrl,
          keyboardType:  TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            labelText: "Nova Tarefa",
            labelStyle: TextStyle(
              color: Colors.white,
            )
          ),
        ),
      ),
      body: ListView.builder(
      itemCount: widget.items.length,
        itemBuilder: (ctxt, index ){
        final item = widget.items[index];
        return CheckboxListTile(
            title: Text(item.title),
            key: Key(item.title),
            value: item.done,
            onChanged: (value) {
              setState(() {
                item.done = value;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: add,
        child: Icon(Icons.add),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }
}
