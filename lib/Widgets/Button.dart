import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatefulWidget {

  String text;
  final VoidCallback onPressed;
  final Color c1;
  final Color c2;
  final Color border;
  double? width;


  AppButton({this.width,required this.text,required this.border,required this.onPressed,required this.c1,required this.c2});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return

      InkWell(onTap: widget.onPressed,
        child: Container(
padding: EdgeInsets.all(10),
          height: 50.h,
          width: widget.width,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [widget.c1, widget.c2],
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.50, color: widget.border),
              borderRadius: BorderRadius.circular(50),

            ),
          ),
          child: Center(child: Text(widget.text,style: TextStyle(color: Colors.white,fontSize: 18,

            fontWeight: FontWeight.w400,),)),
        ),
      );
  }
}
