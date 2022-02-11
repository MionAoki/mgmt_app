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

          //bottom
          bottomNavigationBar:BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_box),
                label: 'Add contents',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.format_list_bulleted),
                label: 'List',
              ),
            ],
            selectedItemColor: Colors.amber[800],
          ),
    );
  }
}

