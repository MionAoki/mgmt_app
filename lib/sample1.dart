import 'package:flutter/material.dart';
import 'main.dart';


class Sample1 extends StatefulWidget{
  @override
  _Sample1State createState() => _Sample1State();
}

class _Sample1State extends State<Sample1>{

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sample page 1'),
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



