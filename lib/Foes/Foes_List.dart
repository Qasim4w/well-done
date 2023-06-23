import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:well_done/Foes/Add_Foe.dart';
import 'package:well_done/Friends/Add_Friends.dart';

class Foes_list_view extends StatefulWidget {
  const Foes_list_view({Key? key}) : super(key: key);

  @override
  State<Foes_list_view> createState() => _Foes_list_viewState();
}

class _Foes_list_viewState extends State<Foes_list_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Padding(
          padding:  EdgeInsets.only(left: 75.w,),
          child: Text('Friends List'),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return  Column(
                    children: [
                      Card(
                        borderOnForeground: false,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:   [SizedBox(height: 10.h,),
                              Text('Foe 1',style: TextStyle(color: Colors.black,),),
                              SizedBox(height: 10.h,),
                            ],
                          ),
                        ),
                      ),
                      Divider(thickness: 2,color: Colors.black,height: 45)
                    ],
                  );

                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (){Get.to(Add_Foe_view());},
        child: Icon(Icons.add,),
      ),
    );
  }
}
