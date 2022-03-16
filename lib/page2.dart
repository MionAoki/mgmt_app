
import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'main.dart';
import 'sample_db1.dart';

class Page2 extends StatefulWidget{
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2>{
  //final create = CreateList();
  final db = SQLite();
  bool isShow = false;

  @override
  Widget build(BuildContext context) {

    //StreamBuilder用のStream型の変数を用意
    final Stream list = (() {
      late final StreamController controller;
      controller = StreamController( //streamを制御するコントローラーを設定
        onListen: () async { //Listenするときの処理
          var allList = await db.getMemos(); //awaitすることでallListに値を入れる
          controller.add(allList);
          await controller.close();
        },
      );
      return controller.stream;
    })();

    return Scaffold(
      appBar: AppBar(
        title: Text('Sample page 2'),
      ),
      
      body: 
      Container(
        child:StreamBuilder(
          stream: list, //上で用意したStream型の変数(list)を入れる
          builder: (BuildContext context, AsyncSnapshot snapShot){

            return ListView.builder( //リストを表示
              itemCount: isShow? snapShot.data.length: 1,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.blue,
                  child: Row(

                  children:<Widget>[
                    Card(
                      child: isShow? Text(snapShot.data[index].toDo.toString()):Text('noData'),
                    ),
                    Card(
                      child: isShow? Text(snapShot.data[index].sTime.toString()):Text('noData'),
                    ),
                    Card(
                      child: isShow? Text(snapShot.data[index].eTime.toString()):Text('noData'),
                    ),
                  ],
                ),

                );
              },
            );
          },
        ),
      ),
    );
  }
}//_Page2State end



