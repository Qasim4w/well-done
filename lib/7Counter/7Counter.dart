// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
//
// class Tasbeeh_Screen extends StatefulWidget {
//   const Tasbeeh_Screen({Key? key}) : super(key: key);
//
//   @override
//   State<Tasbeeh_Screen> createState() => _Tasbeeh_ScreenState();
// }
//
// class _Tasbeeh_ScreenState extends State<Tasbeeh_Screen> {
//   Timer? _timer = Timer(const Duration(seconds: 0), () {});
//   Timer? _timer1 = Timer(const Duration(seconds: 0), () {});
//   Timer? _timer2 = Timer(const Duration(seconds: 0), () {});
//   Timer? _timer3 = Timer(const Duration(seconds: 0), () {});
//   Timer? _timer4 = Timer(const Duration(seconds: 0), () {});
//   Timer? _timer5 = Timer(const Duration(seconds: 0), () {});
//   Timer? _timer6 = Timer(const Duration(seconds: 0), () {});
//   int _start = 0;
//   int _start1 = 0;
//   int _start2 = 0;
//   int _start3 = 0;
//   int _start4 = 0;
//   int _start5 = 0;
//   int _start6 = 0;
//   List<String> weeklyDays = [
//     'assets/images/Day.png',
//     'assets/images/Moon.png',
//     'assets/images/night.png',
//     'assets/images/topic-4.png',
//     'assets/images/topic-5.png',
//     'assets/images/topic-6.png',
//     'assets/images/topic-7.png',
//   ];
//   List<dynamic> percentValue = [];
//
//   void stop() {
//     if (_timer != null) {
//       setState(() {
//         // _start = 0;
//         _timer!.cancel();
//         _timer1!.cancel();
//         _timer2!.cancel();
//         _timer3!.cancel();
//         _timer4!.cancel();
//         _timer5!.cancel();
//         _timer6!.cancel();
//       });
//     }
//   }
//
//   void startTimer() {
//     const oneSec = Duration(seconds: 1);
//     // _start = 0;
//     print("this is timer value inside if ${_start.toString()}");
//     _timer = Timer.periodic(
//       oneSec,
//       (Timer timer) {
//         if (_start < 60) {
//           setState(() {
//             print("this is timer value ${_start.toString()}");
//             percentValue.add(_start);
//             _start++;
//           });
//         } else if (_start1 < 60) {
//           setState(() {
//             print("this is timer value ${_start1.toString()}");
//             percentValue.add(_start1);
//             _start1++;
//           });
//         } else if (_start2 < 60) {
//           setState(() {
//             print("this is timer value ${_start2.toString()}");
//             percentValue.add(_start2);
//             _start2++;
//           });
//         } else if (_start3 < 60) {
//           setState(() {
//             print("this is timer value ${_start3.toString()}");
//             percentValue.add(_start3);
//             _start3++;
//           });
//         } else if (_start4 < 60) {
//           setState(() {
//             print("this is timer value ${_start4.toString()}");
//             percentValue.add(_start4);
//             _start4++;
//           });
//         } else if (_start5 < 60) {
//           setState(() {
//             print("this is timer value ${_start5.toString()}");
//             percentValue.add(_start5);
//             _start5++;
//           });
//         } else {
//           if (_start6 >= 60) {
//             print("timer 1 cancel ");
//             setState(() {
//               timer.cancel();
//             });
//           } else {
//             setState(() {
//               print("this is timer value ${_start6.toString()}");
//               percentValue.add(_start6);
//               _start6++;
//             });
//           }
//         }
//         // else {
//
//         // }
//         // }
//       },
//     );
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     startTimer();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var timerValue = _start / 60;
//     // var timerValueSecond = timerValue * 1;
//     ///
//     var timerValue1 = _start1 / 60;
//     // var timerValueSecond1 = timerValue1 * 1;
//     ///
//     var timerValue2 = _start2 / 60;
//     // var timerValueSecond2 = timerValue2 * 1;
//     ///
//     var timerValue3 = _start3 / 60;
//     // var timerValueSecond3 = timerValue3 * 1;
//     ///
//     var timerValue4 = _start4 / 60;
//     // var timerValueSecond4 = timerValue4 * 1;
//     ///
//     var timerValue5 = _start5 / 60;
//     // var timerValueSecond5 = timerValue5 * 1;
//     ///
//     var timerValue6 = _start6 / 60;
//     // var timerValueSecond6 = timerValue6 * 1;
//     return Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _timer!.isActive ? stop() : startTimer();
//         },
//         backgroundColor: Colors.yellowAccent,
//         child: _timer!.isActive
//             ? Icon(
//                 Icons.pause,
//                 size: 50,
//                 color: Colors.black,
//               )
//             : Icon(
//                 Icons.play_arrow_sharp,
//                 size: 50,
//                 color: Colors.black,
//               ),
//       ),
//       appBar: AppBar(
//         backgroundColor: Colors.black12,
//         iconTheme: IconThemeData(color: Colors.black),
//         elevation: 0,
//         title: Text(
//           "Timer ${_timer!.isActive ? "start" : "stop"}",
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: Container(
//         padding: EdgeInsets.only(left: 20, right: 20, top: 10),
//         width: double.infinity,
//         child: ListView.builder(
//             itemCount: weeklyDays.length,
//             physics: NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemBuilder: ((context, index) {
//               return Container(
//                 padding: EdgeInsets.symmetric(horizontal: 10),
//                 margin: const EdgeInsets.only(bottom: 5, top: 5),
//                 width: double.infinity,
//                 // decoration: BoxDecoration(
//                 //   color: Colors.red,
//                 //   borderRadius: BorderRadius.circular(15)
//                 // ),
//                 decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.teal.shade100,
//                         spreadRadius: 1,
//                         blurRadius: 1,
//                         offset: Offset(1.5, 3), // changes position of shadow
//                       ),
//                     ],
//                     image: const DecorationImage(
//                         image: AssetImage('assets/icons/dashboard.png'),
//                         fit: BoxFit.fill),
//                     borderRadius: BorderRadius.circular(25)),
//                 height: MediaQuery.of(context).size.height * 0.11,
//                 child: Center(
//                   child: Row(
//                     children: [
//                       CircularPercentIndicator(
//                         radius: 20.0,
//                         backgroundColor: Colors.grey.shade100,
//                         progressColor: Colors.teal,
//                         lineWidth: 5.0,
//                         percent: index == 0
//                             ? timerValue
//                             : index == 1
//                                 ? timerValue1
//                                 : index == 2
//                                     ? timerValue2
//                                     : index == 3
//                                         ? timerValue3
//                                         : index == 4
//                                             ? timerValue4
//                                             : index == 5
//                                                 ? timerValue5
//                                                 : timerValue6,
//                         center: Text(
//                           index == 0
//                               ? _start.toString()
//                               : index == 1
//                                   ? _start1.toString()
//                                   : index == 2
//                                       ? _start2.toString()
//                                       : index == 3
//                                           ? _start3.toString()
//                                           : index == 4
//                                               ? _start4.toString()
//                                               : index == 5
//                                                   ? _start5.toString()
//                                                   : _start6.toString(),
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 20.0),
//                         ),
//                       ),
//                       Spacer(),
//                       Container(
//                         child: Image.asset(
//                           weeklyDays[index],
//                           fit: BoxFit.contain,
//                         ),
//                         height: 90.h,
//                         width: 130.w,
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             })),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

class NotificationWeekAndTime {

  final TimeOfDay timeOfDay;

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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //  await prefs.remove('time');

    prefs.setString("time", formattedTime.toString());

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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //  await prefs.remove('time');

    prefs.setString("time", timeOfDay.toString());

    return NotificationWeekAndTime(
        timeOfDay: timeOfDay);
  }

  return null;
}



