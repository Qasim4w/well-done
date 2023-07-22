import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:well_done/Provider/targetScreenProvider.dart';
import 'package:well_done/Widgets/Button.dart';
import 'package:well_done/Widgets/Date_Time.dart';
import 'package:well_done/Widgets/Project_TextField.dart';
import 'package:well_done/Widgets/dropDown_Field.dart';
import 'package:well_done/boxes/boxes.dart';
import 'package:well_done/globalVariable.dart';
import 'package:well_done/models/target_model.dart';
import 'package:well_done/utils/AppColor.dart';

import '../DataLink/Streaming/Universal.dart';
import '../notificationServices/notification_provider.dart';
import '../notificationServices/timeprovider.dart';
import 'TargetListView.dart';

class Add_target extends StatefulWidget {
  Add_target({Key? key}) : super(key: key);

  @override
  State<Add_target> createState() => _Add_targetState();
}

class _Add_targetState extends State<Add_target> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  NotificationWeekAndTime? pickedSchedule;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TargetProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 95),
          child: Text('Target'),
        ),
        backgroundColor: AppColor.purple.withOpacity(.8),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Add target name',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  App_TextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a target name';
                      }
                      return null; // Return null if the value is valid
                    },
                    hintText: 'Target name',
                    labelText: '',
                    controller: provider.targetName,
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Add Description',
                    style: TextStyle(color: Colors.black),
                  ),
                    SizedBox(
                    height: 5,
                  ),
                  App_TextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a target Description';
                        }

                        return null; // Return null if the value is valid
                      },
                      hintText: '',
                      labelText: '',
                      controller: provider.targetDescription,
                      maxline: 10,
                      fieldheight: 200),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Add Frequency',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Consumer<TargetProvider>(
                    builder: (contex, provider, child) {
                      return TextFormField(
                        validator: (value) {
                          if (value == null) {
                            return 'Please select an option';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColor.purple),
                              borderRadius: BorderRadius.circular(10)),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: dropDown(
                                hintText: provider.hintText,
                                items: provider.items,
                                onChanged: (value) {
                                  provider.onchange(value!);
                                }),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.purple),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      );
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
                      // GestureDetector(
                      //   onTap: () async {
                      //     var selecteddate = await showDatePicker(
                      //         context: context,
                      //         initialDate: DateTime.now(),
                      //         lastDate: DateTime(2050),
                      //         firstDate: DateTime(2023));
                      //     if (selecteddate != null) {
                      //       Provider.of<TargetProvider>(context, listen: false)
                      //           .updateDate(selecteddate);
                      //     }
                      //   },
                      //   child: Consumer<TargetProvider>(
                      //     builder: (context, TargetProvider, _) => Container(
                      //       padding: EdgeInsets.all(10),
                      //       height: 50,
                      //       decoration: BoxDecoration(
                      //         border: Border.all(color: AppColor.purple),
                      //         borderRadius: BorderRadius.circular(10),
                      //       ),
                      //       child: Center(
                      //         child: Text(
                      //           TargetProvider.date,
                      //           style: TextStyle(
                      //               fontSize: 25, color: Colors.black),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: 15.w,
                      // ),
                      GestureDetector(
                        onTap: () async {
                          pickedSchedule = await pickSchedule(context);
                          print("88888888888888888,,,,,,,,,,,,,8888888888888888888888888888888888    ${pickedSchedule?.time}     ");
                          // provider = Provider.of<TargetProvider>(context);
                          // provider.updateTime();
                          /*var selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),

                );*/
                          // if (pickedSchedule != null) {
                          //   Provider.of<TargetProvider>(context, listen: false).updateTime(selectedTime);
                          // }
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.purple),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child:
                              Obx(() => Text('Time & Date: ${Universal.targettime}',style: TextStyle(
                                  fontSize: 13, color: Colors.black),),

                              )
                          ),
                        )
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: AppButton(
                        c1: AppColor.purple,
                        c2: AppColor.lightpurple,
                        border:AppColor.purple,
                        text: 'save',
                        onPressed: () async {
                          if (_key.currentState!.validate()) {
                            // NotificationService.cancelScheduledNotifications();
                            print(
                                "----------------------${pickedSchedule}------------,,,,,,,,-------------------------");
                            print(
                                "----------------------${pickedSchedule?.timeOfDay.month}------------------${pickedSchedule?.timeOfDay.day}---------------------"); print(
                                "----------------------${pickedSchedule?.timeOfDay.year}-------------------------------------");

                            await NotificationService.showNotification(
                              title:
                                  "${Emojis.person_role_health_worker} Remainder",
                              body: "please Set your Target ِ",
                              scheduled: true,
                              interval: 5,
                              payload: {"navigate":"Target"},
                              actionButtons: [
                                NotificationActionButton(key: 'check', label: 'check it out',actionType: ActionType.SilentAction,color: Colors.orange)
                              ],
                              notificationSchedule: pickedSchedule,
                            );

                            final data = TargetModel(
                                TargetName: provider.targetName.text.toString(),
                                Frequency: provider.hintText,
                                Date: provider.date,
                                Description:
                                    provider.targetDescription.text.toString(),
                                Time: Universal.targettime.value);
                            final box = Boxes.getData();
                            print(GlobalVariable.time.toString());

                            final existingIndex = box.values
                                .cast<TargetModel>()
                                .toList()
                                .indexWhere((target) =>
                                    target.TargetName == data.TargetName);

                            if (existingIndex == -1) {
                              box.add(data);
                              data.save();
                              Get.back();
                              Get.snackbar('', 'Congrulation');
                            } else {
                              // Handle the case when the entry already exists
                              print(
                                  '**********************************Entry already exists in the box.**********************************');
                              Get.snackbar('', 'Data Already Exits');
                            }
                            Get.back();

                            provider.controllerClear();
                          } else {
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

class Person {
  String name;

  Person(this.name);
}
