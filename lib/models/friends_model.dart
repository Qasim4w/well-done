import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
part 'friends_model.g.dart';


@HiveType(typeId: 2)

class FriendsModel extends HiveObject{
  @HiveField(0)
  String friendsname;
  @HiveField(1)
  String targetname;
  @HiveField(2)
  double Friendsopacity;


  FriendsModel({required this.friendsname,required this.targetname,required this.Friendsopacity});
}