import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newborak/model.dart';


void main() => runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<UsersDetail> _list = [];
  var loading = false;
  Future<Null> _fetchData() async {
    setState(() {
      loading = true;
    });
    final response =
        await http.get("https://nexzen.salebee.net/Tracker/TestProspectJsonData?Token=0F508E03006C08404606C0680FA0EC02A0E306F0D20B10D403C0980C404A03705204606E04709304F07905D0190CE044");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _list.add(UsersDetail.fromJson(i));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("SaleBee"),
      ),

      body: Container(
        child: loading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, i) {
                  final x = _list[i];
                  return GestureDetector(
                    onTap: () {
        final snackBar = SnackBar(duration: Duration(seconds: 1), content: Text("You are going to details page"));

        Scaffold.of(context).showSnackBar(snackBar);
        Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new SecondPage(_list[i])));
      },
               
                    child:Card(
                      color: (i % _list.length == 5) ? Colors.red : Colors.green,
                    child:Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(x.name,
                        style:TextStyle( 
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                        )),
                        Text(x.code),
                        Text(x.smsType),
                        Text(x.email),
                        SizedBox(
                          height: 5.0,
                        ),
                        
                        
                      ],
                    ),
                    ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}




class SecondPage extends StatelessWidget {
  SecondPage(this.x);
  final x;
  @override
  Widget build(BuildContext context) => new Scaffold(
      appBar: new AppBar(title: new Text('Detail Page'),
      centerTitle: true,),
      body: 
       new ListView(children: <Widget>[
       Card(
         color: Colors.white70,
        child:  Column(
          children: <Widget>[
           Text(x.email),
           
      Text(x.name),
      Text(x.code),
      Text(x.smsType),
       ],),


      ),
      Card(
        color: Colors.white60,
        child:
        Column(children: <Widget>[
      Text(x.contactPersonName),
      Text(x.contactNumber),
      
      Text(x.email),
      Text(x.emails),
      Text(x.contactPersons),
      
          ],

        ),
      ),
      Card(
        color:Colors.white54,
        child:
        Column(children: <Widget>[
Text(x.assignToEmployee),
      Text(x.createdOn),
      // Text(x.isIndividual),
      Text(x.zoneName),
        ],),


      ),
      ],),
  );
}
