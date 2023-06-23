import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:well_done/Foes/Foes_List.dart';
import 'package:well_done/Friends/Add_Friends.dart';
import 'package:well_done/Friends/Friends_list_view.dart';
import 'package:well_done/Targets/Target_details.dart';
import 'package:well_done/Targets/Add_target.dart';
import 'package:well_done/Widgets/Button.dart';

class Targets_list_view extends StatefulWidget {
 String? receiveName;
 String? receiveDescription;
 String? receiveFrequency;


  Targets_list_view({super.key, this.receiveName, this.receiveDescription, this.receiveFrequency});

  @override
  State<Targets_list_view> createState() => _Targets_list_viewState();
}

class _Targets_list_viewState extends State<Targets_list_view> {
  List<String> items = [];


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
          children: [
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  // var name;
                  return  Column(
                    children: [
                      Card(
                        borderOnForeground: false,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [

                            GestureDetector(
                              onTap: (){
                                Get.to(Targets_Details(detailDescription: widget.receiveDescription,detailName: widget.receiveName,));
                              },
                                child: Text(items[index],style: TextStyle(color: Colors.black,),)),

                            SizedBox(height: 20.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                AppButton(text: 'Friends', onPressed: (){Get.to(Friends_list_view());}),
                                AppButton(text: 'Foes', onPressed: (){Get.to(Foes_list_view());}),
                              ],),
                          ],
                        ),
                      ),
                      Divider(thickness: 2.w,color: Colors.black,height: 45.h)
                    ],
                  );

                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (){Get.to(Add_target());},
        child: Icon(Icons.add,),
      ),
    );
  }
}
