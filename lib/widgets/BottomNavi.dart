
import 'package:flutter/material.dart';

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


