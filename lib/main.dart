import 'package:flutter/material.dart';
import 'mainpage.dart';
import 'sample1.dart';
import 'sample2.dart';
//import '/widgets/BottomNavi.dart';


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

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home>{
  int _currentIndex = 0;
  void _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  static List<Widget> _widgetOptions = <Widget>[
    //初期ページ
    MainPage(),
    // ページ1の画面
    Sample1(),
    // ページ2の画面
    Sample2(),
  ];


  @override
  Widget build(BuildContext context){
    return Scaffold(

          body:_widgetOptions[_currentIndex],

          //bottom
          //bottomNavigationBar: BottomNavi(),
          bottomNavigationBar: BottomNavigationBar(
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
            currentIndex: _currentIndex,
            onTap: _onTapped,
          ),
    );
  }
}
