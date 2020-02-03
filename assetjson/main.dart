
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
void main() { 
  runApp( MaterialApp (title:'My App', home: MyHomePage()));

}
 
  

class MyHomePage extends StatefulWidget {
 

  

  

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List data;
Future<String>loadJsonData()async{
  var jsonText=await rootBundle.loadString('assets/data.json');
  setState(() {
    data=json.decode(jsonText);
  });
  print(jsonText);
}
@override
void initState(){
  this.loadJsonData();
}


  @override
  Widget build(BuildContext context) {
  
    return new Scaffold(
      appBar: new AppBar(
      
        
      ),
      body: 
           ListView.builder(
             itemCount: data.length,
             itemBuilder: (BuildContext context, int index){
               return Column(
                 children: <Widget>[
                   ListTile(
                     leading: CircleAvatar(child: Text(data[index]['name'][0]),),
                     title: Text(data[index]['name']),
                     subtitle: Text(data[index]['email']),
                   ),
                 ],
               );
             },
           ),
    );
  }
}
