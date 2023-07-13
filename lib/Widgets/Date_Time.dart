import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class Date_Time extends StatefulWidget {
  const Date_Time({Key? key}) : super(key: key);

  @override
  State<Date_Time> createState() => _Date_TimeState();
}

class _Date_TimeState extends State<Date_Time> {
  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      decoration: InputDecoration(
          border: OutlineInputBorder()),
      timePickerEntryModeInput: true,
      style: TextStyle(color: Colors.black),
      type: DateTimePickerType.dateTimeSeparate,
      dateMask: 'd MMM, yyyy',
      initialValue: DateTime.now().toString(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      // icon: Icon(Icons.event),
      dateLabelText: 'Date',
      timeLabelText: "Time",
      selectableDayPredicate: (date) {
        // Disable weekend days to select from the calendar
        if (date.weekday == 6 || date.weekday == 7) {
          return false;
        }

        return true;
      },
      onChanged: (val) => print(val),
      validator: (val) {
        print(val);
        return null;
      },
      onSaved: (val) => print(val),
    );
  }
}
