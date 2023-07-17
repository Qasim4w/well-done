
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SunMoonProvider extends ChangeNotifier{
  double xOffset = 25;
  double YdayOffset = 70;

  double xValue = 0;
  double yValue = 0;

  double YNightOffset = 60;
  double xValueNight = 0;
  double yValueNight = 0;

  int dayStarts = 7;
  int dayEnd = 18;
  int dayMid = 13;

  int NightStarts = 19;
  int NightEnd = 7;
  int NightMid = 0;

  void calculateValues() {
    final currentTime = DateTime.now().hour;

    if (currentTime > dayStarts && currentTime <= dayMid) {
      xValue = (currentTime - dayStarts) * xOffset;
      yValue = (currentTime - dayStarts) * YdayOffset;
    } else if (currentTime <= dayEnd && currentTime > dayMid) {
      xValue = (dayEnd - currentTime) * xOffset;
      yValue = (currentTime - dayStarts) * YdayOffset;
    }

    if (currentTime >= NightStarts && currentTime >= NightMid) {
      xValueNight = (currentTime - NightStarts) * xOffset;
      yValueNight = (currentTime - NightStarts) * YNightOffset;
    } else if (currentTime == NightMid) {
      xValueNight = (NightEnd - currentTime) * xOffset;
      yValueNight = (NightEnd + currentTime) * YNightOffset;
    } else if (currentTime < NightEnd && currentTime > NightMid) {
      xValueNight = (NightEnd - currentTime) * xOffset;
      yValueNight = (NightEnd + currentTime) * YNightOffset;
    }

    notifyListeners();
  }
}
