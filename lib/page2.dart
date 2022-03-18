
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
  final db = SQLite();

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
              itemCount: snapShot.data?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.blue,
                  child: Row(

                  children:<Widget>[
                    if(snapShot.data != null)
                    Card(
                      child: Text(snapShot.data[index].toDo.toString()),
                    ),
                    Card(
                      child: Text(snapShot.data[index].sTime.toString()),
                    ),
                    Card(
                      child: Text(snapShot.data[index].eTime.toString()),
                    ),

                    if(snapShot.data == null)
                    Card(
                      child: Text('NoData'),
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



