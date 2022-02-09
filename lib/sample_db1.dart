
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

void main() async{

    //テーブルの作成
    final database = openDatabase(
    //テーブルの作成場所の指定
    join(await getDatabasesPath(), 'memo_database.db'),
    onCreate:(db,version){ //テーブルの作成
        return db.execute("CREATE TABLE memo(id INTEGER PRIMARY KEY, text TEXT, priority INTEGER)",);
    },
    version: 1,
    );

    //データの挿入
    Future<void> insertMemo(Memo memo) async {
        final Database db = await database;
        await db.insert( //openDatabaseで作成したインスタンスに対してINSERTする
            'memo', //対象のテーブル名
            memo.toMap(), //保存するデータのMap
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

final todo = Memo(
  id: 0, 
  text: 'Flutterで遊ぶ', 
  priority: 1,
);
await insertMemo(todo); //todoをINSERTする
print(await getMemos());

}

class Memo {
  final int id;
  final String text;
  final int priority;

  Memo({this.id,this.text,this.priority});

  Map<String,dynamic> toMap(){ //memo型からmap型に変換
    return{
      'id':id,
      'text':text,
      'priority':priority,
    };
  }
}

