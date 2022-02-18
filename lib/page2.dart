
import 'package:flutter/material.dart';
import 'main.dart';

class Page2 extends StatefulWidget{
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2>{

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}



