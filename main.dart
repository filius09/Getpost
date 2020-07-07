import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getpost/get_result_model.dart';
import 'package:getpost/post_result_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult = null;
  User user = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("API Demo"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text((postResult != null)?
              postResult.id + " | " +
                  postResult.name + " | " +
                  postResult.job + " | " +
                  postResult.created : "Tidak Ada Data"
              ),
              RaisedButton(
                onPressed:(){
                  PostResult.connectToAPI("Tracey", "Filius").then((value){
                    postResult = value;
                    setState(() {});
                  });
                },
                child: Text("POST"),
              ),

              Text((user != null)
                  ? user.id
                  + " | "
                  + user.name
                  : "Tidak Ada Data",

                style: TextStyle(fontSize: 20),

              ),

              RaisedButton(
                onPressed:(){
                  User.connectToAPI('6').then((value) {
                    user = value;
                    setState(() {
                    });
                  });
                },
                child: Text("GET"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}