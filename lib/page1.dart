import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart'; //date,time
import 'package:intl/intl.dart';//time format
import 'main.dart';
import 'mainpage.dart';
import 'sample_db1.dart';


class Page1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add contents'),
        ),
        body:Center(
          child:AddText(),
        ),
    );
  }
}


class AddText extends StatefulWidget{
  @override
  _AddTextState createState() => _AddTextState();
}

class _AddTextState extends State<AddText>{
  final db = SQLite();

  //input text
  String _text = '';
  void _fillText(String e){
    setState((){
      _text = e;
    });
  }

  //input date&time
  var _starttime = new DateTime.now();
  var _endtime = new DateTime.now();
  var formatter = new DateFormat('yyyy/MM/dd(E) HH:mm');


  void _insertDatas(String toDo, String sTime, String eTime) async{
    var datas = Memo(
      id: 0, 
      toDo: toDo, 
      sTime: sTime, 
      eTime: eTime, 
      DoY: 'Y'
      );
    await db.insertMemo(datas);
  }
  

  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(left:50,right:50),
      padding: const EdgeInsets.all(30),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:<Widget>[
          Container(
            margin: const EdgeInsets.only(bottom:20),
            child:Text('Fill out your contents',textAlign:TextAlign.right),
          ),

          //textbox
          Container(
            padding: const EdgeInsets.only(bottom:20),
            child:new TextFormField(
              enabled: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.task),
                labelText: 'ToDo',
              ),
              validator:(String? value) {
                return (value!=null) ? '必須入力です' : null;
              },
              onChanged: _fillText,
            ),
          ),

          //input date&time
          Container(
            padding: const EdgeInsets.only(bottom:20),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[
                Padding(
                  padding:const EdgeInsets.only(right:20),
                  child:Icon(Icons.access_time,),
                ),
                
                Text("start time"),

                Expanded(
                  child:ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      fixedSize: Size(200, 20), //button size
                    ),
                    child: Text(formatter.format(_starttime),),
                    onPressed: (){
                      DatePicker.showDateTimePicker(
                        context,
                        showTitleActions: true,
                        onConfirm: (date) {
                          setState(() {
                            _starttime = date;
                          });
                        }, 
                        currentTime: DateTime.now(), 
                      );
                    },
                  ),
                ),
              ],
            ),//child end
          ),//container end

          Container(
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[
                Padding(
                  padding:const EdgeInsets.only(right:20),
                  child:Icon(Icons.access_time_filled,),
                ),
                Text("end time"),

                Expanded(
                  child:ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                    ),
                    child: Text(formatter.format(_endtime),),
                    onPressed: (){
                      DatePicker.showDateTimePicker(
                        context,
                        showTitleActions: true,
                        onConfirm: (date) {
                          setState(() {
                            _endtime = date;
                          });
                        }, 
                        currentTime: DateTime.now(), 
                      );
                    },
                  ),
                ),
              ],
            ),//child end
          ), //containar end

          Container(
            margin: const EdgeInsets.only(top:20,bottom:20),
            child:ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
                fixedSize: Size(200, 20),
              ),
              child: Text('Add'),
              onPressed: ()async{
                _insertDatas(_text,formatter.format(_starttime),formatter.format(_endtime));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //builder: (BuildContext context) => MainPage("hogehoge"),
                    builder: (BuildContext context) => Home(),
                  )
                );
              }
            ), 
          ),//Containar end

        ],//Column end
      ),
    );
  }
}



