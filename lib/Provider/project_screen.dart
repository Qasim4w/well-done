
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:well_done/models/friends_model.dart';

import '../models/target_model.dart';

class ProjectScreenProvider with ChangeNotifier{
  bool _leftFoe = false;
  bool   get leftFoe => _leftFoe;


  void changeLeftFoe(bool value){
    _leftFoe = value;
    notifyListeners();
  }
  bool _rightFoe = false;
  bool   get rightFoe => _rightFoe;

  void changeRightFoe(bool value){
    _rightFoe = value;
    notifyListeners();
  }
  bool _centreTitleBox = false;
  bool   get centreBoxVisibility => _centreTitleBox;

  void changeCentreTitleBox(bool value){
    _centreTitleBox = value;
    notifyListeners();
  }
  bool _titleContainer = false;
  bool   get titleContainer => _titleContainer;

  void changeTitleContainer(bool value){
    _titleContainer = value;
    notifyListeners();
  }
  bool _detailBoxCentre = false;
  bool   get detailBoxCentre => _detailBoxCentre;

  void changedetailBoxCentre(bool value){
    _detailBoxCentre = value;
    notifyListeners();
  }





}