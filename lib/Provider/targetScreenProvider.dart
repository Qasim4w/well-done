

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:well_done/globalVariable.dart';
import 'package:well_done/models/target_model.dart';

class TargetProvider with ChangeNotifier{
  String date= DateTime.now().day.toString()+'/'+DateTime.now().month.toString()+'/'+DateTime.now().year.toString();
  String _time=DateTime.now().hour.toString()+':'+DateTime.now().minute.toString();

  String get time=> _time;

  updateTime() {
    _time = GlobalVariable.time.toString();
    notifyListeners();
  }
  updateDate(DateTime selecteddate) {
    date = selecteddate.day.toString() + '/' + selecteddate.month.toString() + '/' + selecteddate.year.toString();
    notifyListeners();
  }
  ///////////
  TextEditingController targetName =TextEditingController();
  TextEditingController targetDescription =TextEditingController();



  ////
   void controllerClear(){
    targetName.clear();
    targetDescription.clear();
    _hintText= 'Frequency';

  }
List<String> items = [
  'Hour', 'Day', 'Month', 'Year'
];
String _hintText='Frequency';
get   hintText =>_hintText;
onchange(String value){
  _hintText = value;
  notifyListeners();


}





}



