import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:well_done/Provider/friendsprovider.dart';
import 'package:well_done/Provider/targetScreenProvider.dart';
import 'package:well_done/Widgets/Button.dart';
import 'package:well_done/Widgets/Date_Time.dart';
import 'package:well_done/Widgets/Project_TextField.dart';
import 'package:well_done/Widgets/dropDown_Field.dart';
import 'package:well_done/boxes/boxes.dart';
import 'package:well_done/models/friends_model.dart';
import 'package:well_done/utils/AppColor.dart';

import '../Targets/TargetListView.dart';
import '../Provider/foeProvider.dart';

class Add_Friends extends StatefulWidget {
  String Targetname;
  Add_Friends({Key? key,required this.Targetname}) : super(key: key);

  @override
  State<Add_Friends> createState() => _Add_FriendsState();
}

class _Add_FriendsState extends State<Add_Friends> {



  String _name = '';
  GlobalKey<FormState> _key =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<FriendsProvider>(context);
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text('Friends Details'),
        backgroundColor: AppColor.Green,
      ),
      body: SingleChildScrollView(
        physics:  BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    widget.Targetname,
                    style: TextStyle(color: Colors.black,fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Add Friends name',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  App_TextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Friend name';
                      }
                      return null; // Return null if the value is valid
                    },
                    hintText: 'Friend name',
                    labelText: '',

                    controller: provider.FriendsName,
                    onChanged: (value) {
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),



                  Text(
                    'Pick Date & Time',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          var selecteddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),



                              lastDate: DateTime(2050), firstDate:  DateTime(2023)
                          );
                          if (selecteddate != null) {
                            Provider.of<TargetProvider>(context, listen: false).updateDate(selecteddate);
                          }
                        },
                        child: Consumer<FriendsProvider>(
                          builder: (context, FriendsProvider, _) => Container(
                            padding: EdgeInsets.all(10),
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                FriendsProvider.date,
                                style: TextStyle(fontSize: 25, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 15.w,
                      ),
                      GestureDetector(
                        onTap: () async {
                          var selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (selectedTime != null) {
                            Provider.of<FoeProvider>(context, listen: false).updateTime(selectedTime);
                          }
                        },
                        child: Consumer<FoeProvider>(
                          builder: (context, TargetProvider, _) => Container(
                            padding: EdgeInsets.all(10),
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                TargetProvider.time,
                                style: TextStyle(fontSize: 25, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),



                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: AppButton(
                        c1:AppColor.Green,
                        c2: AppColor.greenlight,
                        border:AppColor.green,
                        text: 'save',
                        onPressed: () {
                          if(_key.currentState!.validate()){
                            final data = FriendsModel(
                              friendsname: provider.FriendsName.text.toString(),
                              targetname: widget.Targetname,
                              Friendsopacity: 0.4,
                            );

                            final box = Boxes.getFriends();

// Check if the entry already exists
                            final existingIndex = box.values.cast<FriendsModel>().toList().indexWhere(
                                  (friend) =>
                              friend.friendsname == data.friendsname &&
                                  friend.targetname == data.targetname,
                            );

                            if (existingIndex == -1) {
                              box.add(data);
                              data.save();
                              Get.snackbar('', 'Congrulation');
                            } else {
                              // Handle the case when the entry already exists
                              print('**********************************Entry already exists in the box.**********************************');
                              Get.snackbar('', 'Entry already exists in the box.');
                            }

                            // box.clear();
                            Get.back();
                            print(data);
                            provider.controllerClear();


                            Get.to(TargetListScreen());
                          }
                          else {
                            Get.snackbar('Warning', 'Please fill the form ');
                          }


                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


