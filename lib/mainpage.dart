
import 'package:flutter/material.dart';
import 'main.dart';
import 'page1.dart';

class MainPage extends StatefulWidget{
    String argument;
    MainPage([this.argument='hoge']);

    @override
    _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar:AppBar(
                title:Text('Time Management'),
            ),
            body:Text(widget.argument),
        );//Scaffold
    }
}