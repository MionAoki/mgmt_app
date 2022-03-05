
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';


class SQLite {

  static late var database;

    //テーブルの作成
    createDb() async{
      database = openDatabase(
          //テーブルの作成場所の指定
          join(await getDatabasesPath(), 'memo_database.db'),
          onCreate:(db,version){ //テーブルの作成
              return db.execute(
                  "CREATE TABLE memo(id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT, priority INTEGER)",
              );
          },
          version: 1,
      );
    }

    //データの挿入
    Future<int> insertMemo(Memo memo) async {
        final Database db = await database;
        return await db.insert( //openDatabaseで作成したインスタンスに対してINSERTする
            'memo', //対象のテーブル名
            memo.insertMap(), //保存するデータのMap
            conflictAlgorithm: ConflictAlgorithm.replace, //コンフリクト時のアルゴリズム(SQLiteでは対応を定義しておける)
        );
    }

    //データの取得
    Future<List<Memo>> getMemos() async {
        final Database db = await database;
        final List<Map<String, dynamic>> maps = await db.query('memo'); //検索query：SQLと同様の書き方(LIKE,INなど可能)
        return List.generate(maps.length, (i) { //戻り値をmemo型のリストに入れる
            return Memo(
                id: maps[i]['id'],
                text: maps[i]['text'],
                priority: maps[i]['priority'],
            );
        });
    }

    //データの更新
    Future<void> updateMemo(Memo memo) async {
        final db = await database;
        await db.update( //書き方はINSERTのときと同様
            'memo',
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
            'memo',
            where: "id = ?",
            whereArgs: [id],
        );
    }
    
}


class Memo {
  final int id;
  final String text;
  final int priority;

  Memo({required this.id, required this.text, required this.priority});

  Map<String,dynamic> toMap(){ //memo型からmap型に変換
    return{
      'id':id,
      'text':text,
      'priority':priority,
    };
  }
  
  Map<String,dynamic> insertMap(){ //memo型からmap型に変換(idなし)
    return{
      'text':text,
      'priority':priority,
    };
  }

  @override
  String toString() {
    return 'Memo{id: $id, text: $text, priority: $priority}';
  }
}