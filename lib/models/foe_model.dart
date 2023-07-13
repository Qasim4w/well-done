import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
part 'foe_model.g.dart';

@HiveType(typeId: 1)

class FoeModel extends HiveObject{
  @HiveField(0)
  String foename;
  @HiveField(1)
  String targetname;
  @HiveField(2)
  double opactiyFoe;



  FoeModel({required this.foename,required this.targetname,required this.opactiyFoe});
}