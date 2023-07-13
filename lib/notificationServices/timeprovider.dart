import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:well_done/globalVariable.dart';

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

class NotificationWeekAndTime {

  final TimeOfDay timeOfDay;
 String time=DateTime.now().toString();

  NotificationWeekAndTime({
    required this.timeOfDay,
  });
}

Future<NotificationWeekAndTime?> pickSchedule(
    BuildContext context,
    ) async {

  TimeOfDay? timeOfDay;
  DateTime now = DateTime.now();
  timeOfDay    = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    builder: (BuildContext context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child!,
      );
    },
  );

  if (timeOfDay != null) {
    DateTime now = DateTime.now();
    DateTime selectedDateTime = DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    String formattedTime = DateFormat('hh:mm a').format(selectedDateTime);
    GlobalVariable.time=formattedTime;
    //  await prefs.remove('time');



    return NotificationWeekAndTime(
        timeOfDay: timeOfDay);
    print(formattedTime); // Display the selected time in "hh:mm a" format (e.g., "11:20 PM")
  }








  /* await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(
          now.add(
            Duration(minutes: 1),
          ),
        ),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              colorScheme: ColorScheme.light(
                primary: Colors.teal,
              ),
            ),
            child: child!,
          );
        });*/

  if (timeOfDay != null) {

    //  await prefs.remove('time');


    return NotificationWeekAndTime(
        timeOfDay: timeOfDay);
  }

  return null;
}