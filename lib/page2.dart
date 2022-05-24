
import 'dart:async';
import 'dart:developer';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'sample_db1.dart';

class Page2 extends StatefulWidget{
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2>{
  final db = SQLite();

  void _deleteDatas(int i) async{
    var selectId;
    var allList = await db.getMemos();
    selectId = allList[i].id;
    await db.deleteMemo(selectId);
  }

  bool _activeSwitch = false;
  void _changeSwitch(bool e) => setState(() => _activeSwitch = e);

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
        title: Text('All List'),
      ),
      
      body:
      Container(
        margin: EdgeInsets.only(top:20),
        width: double.infinity,
        child:StreamBuilder(
          stream: list, //上で用意したStream型の変数(list)を入れる
          builder: (BuildContext context, AsyncSnapshot snapShot){
            var ListLength = snapShot.data?.length ?? 1;
            return DataTable( //テーブルを作成するclass
              columnSpacing: 0,
              columns: [
                DataColumn(label: Row(children:<Widget>[Icon(Icons.task),Text('toDo')])),
                DataColumn(label: Row(children:<Widget>[Icon(Icons.access_time),Text('startTime')])),
                DataColumn(label:  Row(children:<Widget>[Icon(Icons.access_time),Text('endTime')])),
                DataColumn(label: Text('')),
              ],
              rows: [
                if(snapShot.data != null)
                  for (var i=0; i<ListLength; i++)
                  DataRow(cells: [
                    DataCell(Text(snapShot.data[i].toDo.toString())),
                    DataCell(Text(snapShot.data[i].sTime.toString())),
                    DataCell(Text(snapShot.data[i].eTime.toString())),
                    DataCell(_editButton(i),),

                  ],),
                if(snapShot.data == null)
                  DataRow(cells: [
                    DataCell(Text('NoData')),
                    DataCell(Text('NoData')),
                    DataCell(Text('NoData')),
                    DataCell(Text('NoData')),
                  ],),
              ],
            );
          },
        ),

      ),
    );
  }

//deleteButton
  Widget _deleteButton(int i){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        onPrimary: Colors.white,
      ),
      child: Text('Delete'),
      onPressed: ()async{
        _deleteDatas(i);
        setState(() {
          i = i-1;
        });
      },
    );
  }

}//_Page2State end


Widget showDoY(String DoY){
  if(DoY == 'D'){
    return const Text('Done');
  }else{
    return const Text('Yet');
  }
}

Widget _editButton(int i){
  return ElevatedButton( //edit
    style: ElevatedButton.styleFrom(
      primary: Colors.blue,
      onPrimary: Colors.white,
    ),
    child: Text('Edit'),
    onPressed: ()async{
    }
  );
}
