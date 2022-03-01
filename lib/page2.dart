
import 'dart:developer';

import 'package:flutter/material.dart';
import 'main.dart';
import 'sample_db1.dart';

class Page2 extends StatefulWidget{
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2>{
  @override
  Widget build(BuildContext context) {
    print(sample_db(id: 1,text: '2番目',priority: 2));

    return Scaffold(
      appBar: AppBar(
        title: Text('Sample page 2'),
      ),
      body:Text('Hello'),
    );
  }

}//_Page2State end



