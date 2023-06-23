import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Targets_Details extends StatelessWidget {

  String? detailName;
  String? detailDescription;

  Targets_Details({this.detailName, this.detailDescription});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding:  EdgeInsets.only(left: 75.w,),
          child: Text('Target List'),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            SizedBox(height: 50.h),
            Text('Name',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
            SizedBox(height: 5.h),
            Text(detailName!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
            SizedBox(height: 15.h),
            Text('Description',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
            SizedBox(height: 5.h),
            Text(detailDescription!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
            SizedBox(height: 15.h),
            Text('Frequency',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
            SizedBox(height: 5.h),
            Text('detailDescription!',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),

          ],
        ),
      ),
    );
  }
}
