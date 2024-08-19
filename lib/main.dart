import 'package:flutter/material.dart';

void main () => runApp(MaterialApp(home:MyHomePage()));

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
   List<String> _todo=["Todo1","Todo2","Todo3"];

   void addtodo(){
    showDialog(
      context: context,
       builder: (BuildContext context){
        String newTodo='';

        return AlertDialog(
          title:Text ("Enter some thing below:"),
          content: TextField(
            onChanged: (value){
              newTodo=value;
            },
          ),
          actions:<Widget> [
            TextButton(
              child: Text("Cancel"),
              onPressed: (){
                Navigator.of(context).pop();
              }
              ),
              TextButton(
              child: Text("Submit"),
              onPressed: (){
                setState(() {
                  _todo.add(newTodo);
                });
                 Navigator.of(context).pop();
              }
              ),
               
          ],
        );

       });
   }

   @override
   Widget build (BuildContext content){
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo list")),
        body: ListView.builder(
          itemCount:_todo.length,
          itemBuilder: (context,index){
           final todo= _todo[index];
           return ListTile(
            title: Text(todo,
            style:TextStyle(
              decoration: todo.startsWith('-') 
              ? TextDecoration.lineThrough
               : TextDecoration.none
            ) ,
            ),
            onTap: (){
              setState(() {
                if(todo.startsWith('-')){
                  _todo[index]= todo.substring(2);
                }
                else{
                   _todo[index]='- $todo';
                }
               
              });
            },
           );
          },
        ),
        floatingActionButton: FloatingActionButton(onPressed:addtodo,child: Icon(Icons.add),),
        );
   }
}