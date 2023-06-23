
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dart:math';

class SunMoonScreen extends StatefulWidget {
  @override
  _SunMoonScreenState createState() => _SunMoonScreenState();
}

class _SunMoonScreenState extends State<SunMoonScreen> {

  double xOffset = 25;
  double YdayOffset = 70;

  double xValue = 0;
  double yValue = 0;

   double YNightOffset = 60;
   double xValueNight = 0;
   double yValueNight = 0;

  int dayStarts = 7;
  int dayEnd = 18;
  int dayMid =  13;


  int NightStarts =  19;
  int NightEnd =  7;
  int NightMid =  0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final currentTime = DateTime.now().hour;
    final isDay = currentTime >= 7 && currentTime <= 18;

    //Day time Method!
    if(currentTime>dayStarts && currentTime <= dayMid  ) {
      xValue =  (currentTime - dayStarts) * xOffset;
      yValue =  (currentTime - dayStarts) * YdayOffset;
    }
    else if (currentTime<=dayEnd && currentTime > dayMid ) {
      xValue =  (dayEnd - currentTime ) * xOffset;
      yValue =  (currentTime - dayStarts) * YdayOffset;
    }

    //Night time Method!
   if(currentTime>=NightStarts && currentTime >= NightMid  ) {
      xValueNight =  (currentTime - NightStarts) * xOffset;
      yValueNight =  (currentTime - NightStarts) * YNightOffset;
    }
    else if (currentTime == NightMid ) {
      xValueNight =  ( NightEnd - currentTime ) * xOffset;
      yValueNight =  (NightEnd + currentTime) * YNightOffset;
    }
    else if(currentTime<NightEnd && currentTime > NightMid){
     xValueNight =  ( NightEnd - currentTime ) * xOffset;
     yValueNight =  (NightEnd + currentTime) * YNightOffset;
   }


    return Container(
      height: screenHeight,
      width: screenWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(isDay ? 'assets/images/Day.png' : 'assets/images/night.png',),fit: BoxFit.cover
        ),
        // gradient: LinearGradient(
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   // colors: isDay
        //   //     ? [Colors.blue.shade100, Colors.blue.shade200]
        //   //     : [Colors.black, Colors.black87],
        // ),
      ),
      child: Stack(
        children: [
          if (!isDay)
            for (int i = 0; i < 50; i++)
              Positioned(
                left: Random().nextDouble() * MediaQuery.of(context).size.width,
                top: Random().nextDouble() * screenHeight,
                child: Container(
                  height: 2,
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          isDay ? Positioned(
              left: xValue,
              top: yValue,
              child: Container(
                height: 100.h,
                width: 100.w,
                child: Image.asset("assets/images/Sun.png",fit: BoxFit.fill,),
              ),
            ) :Positioned(
              left: xValueNight,
              top: yValueNight,
              child:Container(
                height: 73.h,
                width: 74.w,
                child: Image.asset("assets/images/Moon.png",fit: BoxFit.fill,),
              ),
            ),

        ],
      ),
    );
  }
}