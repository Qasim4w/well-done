import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:well_done/DataLink/Streaming/Universal.dart';
import 'package:well_done/globalVariable.dart';

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

class NotificationWeekAndTime {

  final DateTime timeOfDay;
  String time=DateTime.now().toString();

  NotificationWeekAndTime({
    required this.timeOfDay,
  });
}
DateTime? selectedDateTime;
Future<NotificationWeekAndTime?> pickSchedule(
    BuildContext context,
    ) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2021),
    lastDate: DateTime(2025),
    builder: (BuildContext context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child!,
      );
    },
  );

  if (picked != null) {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
Universal.targettime.value="${pickedTime.hour}:${ pickedTime.minute} || ${picked.day}-${ picked.month}-${ picked.year}" ;
print(".....................................................${Universal.targettime}");
      selectedDateTime = DateTime(
        picked.year,
        picked.month,
        picked.day,
        pickedTime.hour,
        pickedTime.minute,

      );
    }

    print("...${picked.year}..........${picked.month}...............${picked.day}............${pickedTime?.hour}.............${pickedTime?.minute}");




    return NotificationWeekAndTime(timeOfDay: selectedDateTime!);
  }


















  return null;
}