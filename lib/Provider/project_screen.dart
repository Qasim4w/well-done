
import 'package:flutter/material.dart';

class ProjectScreenProvider with ChangeNotifier{
  bool _leftFoe = false;
  bool   get leftFoe => _leftFoe;

  void changeLeftFoe(bool value){
    _leftFoe = value;
    notifyListeners();
  }
  void invertLeftFoe(){
    _leftFoe != _leftFoe;
    notifyListeners();
  }


}