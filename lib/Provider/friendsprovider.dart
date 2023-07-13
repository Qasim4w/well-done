

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendsProvider with ChangeNotifier{
  String date= DateTime.now().day.toString()+','+DateTime.now().month.toString()+','+DateTime.now().year.toString();
  String time=DateTime.now().hour.toString()+':'+DateTime.now().minute.toString();


  updateTime(TimeOfDay selectedTime) {
    time = selectedTime.hour.toString() + ':' + selectedTime.minute.toString();
    notifyListeners();
  }
  updateDate(DateTime selecteddate) {
    date = selecteddate.day.toString() + '/' + selecteddate.month.toString() + '/' + selecteddate.year.toString();
    notifyListeners();
  }
  ///////////
  TextEditingController FriendsName =TextEditingController();

  void controllerClear(){
    FriendsName.clear();


  }



}



