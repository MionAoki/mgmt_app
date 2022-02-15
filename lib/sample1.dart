import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'main.dart';


class Sample1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Add contents'),
        ),
        body:Center(
          child:AddText(),
        ),
      ),
    );
  }
}


class AddText extends StatefulWidget{
  @override
  _AddTextState createState() => _AddTextState();
}

class _AddTextState extends State<AddText>{

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

          Container(
            padding: const EdgeInsets.only(bottom:20),
            child:new TextField(
              enabled: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.task),
                labelText: 'ToDo',
              ),
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
                  child:TextButton(
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
                  child:Icon(Icons.access_time,),
                ),
                Text("end time"),

                Expanded(
                  child:TextButton(
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


        ],
      ),
    );
  }
}



