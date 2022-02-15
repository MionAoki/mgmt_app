
import 'package:flutter/material.dart';
import 'main.dart';

class MainPage extends StatefulWidget{
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
            title:Text('Time Management'),
        ),

          //contents
        body:Center(
            child:ListView(
                children:<Widget>[
                    Card(
                        margin:const EdgeInsets.all(20),
                        child:Container(
                            padding:const EdgeInsets.all(20),
                            height: 60,
                            child: Text('Card1', textAlign: TextAlign.center,),
                        ),
                    ),

                    Card(
                        margin:const EdgeInsets.all(20),
                        child:Container(
                            padding:const EdgeInsets.all(20),
                            height: 60,
                            child: Text('Card2', textAlign: TextAlign.center,),
                        ),
                    ),

                    Card(
                        margin:const EdgeInsets.all(20),
                        child:Container(
                            padding:const EdgeInsets.all(20),
                            height: 60,
                            child: Text('Card3', textAlign: TextAlign.center,),
                        ),
                    ),
                ]
            ),
        ),
      ),
    );
  }
}