import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  var items = new List<Item>();
  HomePage(){
    items = [];
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
      save();
    });
  }

  void remove(int index){
    setState(() {
      widget.items.removeAt(index);
      save();
    });
  }

  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('data');

    if (data != null){
      Iterable decoded = jsonDecode(data);
      List <Item> result = decoded.map((x) => Item.fromJson(x)).toList();
      setState(() {
        widget.items = result;
      });
    }
  }
  
  save() async{
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(widget.items));
  }
  
  _HomePageState(){
    load();
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
            labelText: "New Task",
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
        return Dismissible(
          child: CheckboxListTile(
            title: Text(item.title),
            key: Key(item.title),
            value: item.done,
            onChanged: (value) {
              setState(() {
                item.done = value;
                save();
              },
              );
            },
            ),
          key: Key(item.title),
          background: Container(
            color: Colors.red.withOpacity(0.9),
            child: Text(
                "Excluir",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
             ),
            ),
          ),
          onDismissed: (direction){
            remove(index);
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
