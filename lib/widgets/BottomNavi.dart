
import 'package:flutter/material.dart';

//bottom
class BottomNavi extends BottomNavigationBar{
    BottomNavi():super(
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
    );
}


/*
//bottomでのページ遷移
class PageTrans extends StatefulWidget{
  @override
  _PageTransState createState() => _PageTransState();
}

class _PageTransState extends State<PageTrans>{
  int _currentIndex = 0;
  void _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
*/
