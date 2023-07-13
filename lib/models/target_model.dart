import 'package:hive/hive.dart';
part 'target_model.g.dart';

@HiveType(typeId: 0)

class TargetModel extends HiveObject{
  @HiveField(0)
  String TargetName;
  @HiveField(1)
  String Description;
  @HiveField(2)
  String Frequency;
  @HiveField(3)
  String Date;
  @HiveField(4)
  String Time;
  TargetModel({required this.TargetName,required this.Frequency,required this.Date,required this.Description,required this.Time});
}