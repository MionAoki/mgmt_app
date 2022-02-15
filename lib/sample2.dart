
import 'package:flutter/material.dart';
import 'main.dart';

class Sample2 extends StatefulWidget{
  @override
  _Sample2State createState() => _Sample2State();
}

class _Sample2State extends State<Sample2>{

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sample page 2'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: TextButton(
                child: Text("return to main page"),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),


            Column(
              children: <Widget>[
                  TextButton(
                    child: Text("count"),
                    onPressed: (){
                      setState((){
                        count = count + 1;
                      });
                    },
                  ),
                  
                  Text(count.toString()),
              ]
            ),
          ]
        ),
      ),
    );
  }
}



