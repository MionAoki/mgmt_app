
import 'dart:developer';

import 'package:flutter/material.dart';
import 'main.dart';
import 'sample_db1.dart';

class Page2 extends StatefulWidget{
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2>{
  final db = SQLite();

  late List<Memo> memoList = [];

  List<Memo> getList(){
    db.getMemos().then((value){
      memoList = value;
    });
    return memoList;
  }

  @override
  Widget build(BuildContext context) {
    final memoList = getList();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample page 2'),
      ),
      body:_showList(memoList),
    );
  }

  Widget _showList(list){
    return ListView.builder(
      itemCount: list.length.toInt(),
      itemBuilder: (BuildContext context, int index) {
        
        return Text(list[index].toString());
      },
    );
  }

}//_Page2State end




