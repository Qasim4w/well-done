import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:well_done/utils/AppImages.dart';

class ButtonContainer extends StatelessWidget {
  void Function()? onTap;
   ButtonContainer({super.key,required this.onTap,required this.image,required this.isOpened,required this.c1,required this.c2,required this.border});
   Color c1;
   Color c2;
   Color border;
   bool isOpened;
   String image;



  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap,
      child: Container(
        width: 55,
        height: 55,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [c1.withOpacity(.5), c2],
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color:border),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(child:!isOpened ? Image.asset(image,height: 20.h,width: 20.w):Image.asset(AppImages.cross,height: 20.h,width: 20.w)),
      ),
    );
  }
}
