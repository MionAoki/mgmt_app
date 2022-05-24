
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';


class SQLite {

  static late var database;

    //テーブルの作成
    createDb() async{
      database = openDatabase(
          //テーブルの作成場所の指定
          join(await getDatabasesPath(), 'timeMgmtTable.db'),
          onCreate:(db,version){ //テーブルの作成
              return db.execute(
                  "CREATE TABLE timgMgmt(id INTEGER PRIMARY KEY AUTOINCREMENT,toDo TEXT, sTime TEXT, eTime TEXT, DoY TEXT)",
              );
          },
          version: 1,
      );
    }

    //データの挿入
    Future<int> insertMemo(Memo memo) async {
        final Database db = await database;
        return await db.insert( //openDatabaseで作成したインスタンスに対してINSERTする
            'timgMgmt', //対象のテーブル名
            memo.insertMap(), //保存するデータのMap
            conflictAlgorithm: ConflictAlgorithm.replace, //コンフリクト時のアルゴリズム(SQLiteでは対応を定義しておける)
        );
    }


    //データの取得
    Future<List<Memo>> getMemos() async {
        final Database db = await database;
        final List<Map<String, dynamic>> maps = await db.query('timgMgmt'); //検索query：SQLと同様の書き方(LIKE,INなど可能)
        return List.generate(maps.length, (i) {
            return Memo(
              id: maps[i]['id'],
              toDo: maps[i]['toDo'],
              sTime: maps[i]['sTime'],
              eTime: maps[i]['eTime'],
              DoY: maps[i]['DoY'],
            );
        });
    }

    //データの更新
    Future<void> updateMemo(Memo memo) async {
        final db = await database;
        await db.update(
            'timgMgmt', //テーブル名
            memo.toMap(),
            where: "id = ?",
            whereArgs: [memo.id],
            conflictAlgorithm: ConflictAlgorithm.fail,
        );
    }

    //データの削除
    Future<void> deleteMemo(int id) async {
        final db = await database;
        await db.delete( //UPDATEのときと同様(conflictAlgorithmは指定できない) 
            'timgMgmt', //テーブル名
            where: "id = ?",
            whereArgs: [id],
        );
    }
    
}


class Memo {
  final int id;
  final String toDo;
  final String sTime;
  final String eTime;
  final String DoY;

  Memo({required this.id, required this.toDo, required this.sTime,
  required this.eTime,required this.DoY});

  Map<String,dynamic> toMap(){ //memo型からmap型に変換
    return{
      'id':id,
      'toDo':toDo,
      'sTime':sTime,
      'eTime':eTime,
      'DoY':DoY,
    };
  }
  
 Map<String,dynamic> insertMap(){ //insertのときはid不要
    return{
      'toDo':toDo,
      'sTime':sTime,
      'eTime':eTime,
      'DoY':DoY,
    };
  }

   Map<String,dynamic> swichMap(){ //insertのときはid不要
    return{
      'DoY':DoY,
    };
  }
  @override
  String toString() {
    return '{id: $id, toDo: $toDo, sTime: $sTime, eTime: $eTime, DoY: $DoY}';
  }

}