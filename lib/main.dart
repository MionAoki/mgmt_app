import 'package:flutter/material.dart';
import 'sample1.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Home(),
    );
  }
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
          appBar:AppBar(
            title:Text('Time Management'),
          ),
          drawer:Drawer(),
          body:Center(
            child:ListView(
              children:<Widget>[
                Container(
                  color:Colors.blueAccent,
                  child:Text('Hello'),
                  margin:const EdgeInsets.only(top:50,left:20,right:20),
                  padding:const EdgeInsets.all(30),
                ),
                Container(
                  color:Colors.blueAccent,
                  child:Text('こんにちは'),
                  margin:const EdgeInsets.all(50),
                  padding: const EdgeInsets.all(30),
                ),
                ElevatedButton(
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Sample1()
                    ));
                  },
                  child: Text('go to sample1 page'),
                ),
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
    );
  }
}

