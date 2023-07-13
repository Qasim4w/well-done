import 'package:hive/hive.dart';
import 'package:well_done/models/foe_model.dart';
import 'package:well_done/models/friends_model.dart';
import 'package:well_done/models/target_model.dart';

class Boxes{

  static Box<TargetModel> getData() =>Hive.box('target');
  static Box<FoeModel> getFoe() =>Hive.box('foe');
  static Box<FriendsModel> getFriends() =>Hive.box('friends');
}