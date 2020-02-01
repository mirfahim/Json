import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
} 

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map requests;
  List userData;

  Future getData() async {
    http.Response response = await http.get("https://www.getpostman.com/collections/5891d4c7193a3baab52d");
    requests = json.decode(response.body);
    setState(() {
      userData = requests["requests"];
    });
  }
  

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
centerTitle: true,        

        title: Text("BorakApp"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
          itemCount: userData == null ? 0 : userData.length,
          itemBuilder: (BuildContext context, int index) {
            
           return  GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailPage();
                }));
        // final snackBar = SnackBar(content: Text("You are going to details page"));

        // Scaffold.of(context).showSnackBar(snackBar);
      },
          child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),

child:Column( children: <Widget>[
                 Row(
                  children: <Widget>[
                    
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("${userData[index]["id"]} ${userData[index]["name"]}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),),
                    )
                  ],
                ),
                 Padding(
                      padding: const EdgeInsets.all(10.0),
              child:  Text("${userData[index]["description"]}",
              ),
                 ),

                 
                
],
),

              ),
          ),
            );
          },
      ),
    );
  }
}


//...........................................................................................................


class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  Map requests;
  List userData;

  Future getData() async {
    http.Response response = await http.get("https://www.getpostman.com/collections/5891d4c7193a3baab52d");
    requests = json.decode(response.body);
    setState(() {
      userData = requests["requests"];
    });
  }
  

  @override
  void initState() {
    super.initState();
    getData();
  }
  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
centerTitle: true,        

        title: Text("DetailPage"),
        backgroundColor: Colors.green,
      ),

  body:ListView.builder(
          itemCount: userData == null ? 0 : userData.length,
          itemBuilder: (BuildContext context, int index) {
            
           
          return Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),

child:Column( children: <Widget>[
                 Row(
                  children: <Widget>[
                    
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("${userData[index]["id"]} ${userData[index]["name"]}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),),
                    )
                  ],
                ),
                 Padding(
                      padding: const EdgeInsets.all(10.0),
              child:  Text("${userData[index]["description"]}",
              ),
                 ),

                 
                
],
),

              ),
          );
          },
  ),
          );
  }

}