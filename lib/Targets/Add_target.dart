import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:well_done/Provider/targetScreenProvider.dart';
import 'package:well_done/Targets/notificationSchedule.dart';
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
                  GestureDetector(
                    onTap: () async {
                      pickedSchedule = await pickSchedule(context);

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
                            NotificationService.cancelScheduledNotifications();
                            print(
                                "----------------------${pickedSchedule}------------,,,,,,,,-------------------------");
                            print(
                                "----------------------${pickedSchedule?.timeOfDay.month}------------------${pickedSchedule?.timeOfDay.day}---------------------"); print(
                                "----------------------${pickedSchedule?.timeOfDay.year}-------------------------------------");

                            await NotificationService.showNotification(
                              title:
                                  "${Emojis.activites_balloon} Remainder",
                              body: "please Set your Target ِ",
                              scheduled: true,
                              interval: 5,

                              // payload: {"navigate":"Target"},
                              actionButtons: [
                                NotificationActionButton(key: 'Set Notification', label: 'Set Targets',actionType: ActionType.SilentAction,color: Colors.purple),
                                NotificationActionButton(key: 'Ask Me Later', label: 'Ask Me Later ',actionType: ActionType.SilentAction,color: Colors.red,isDangerousOption: true
                                )
                              ],
                              notificationSchedule: pickedSchedule,
                            );

                            final data1 = TargetModel(
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
                                    target.TargetName == data1.TargetName);

                            if (existingIndex == -1) {
                              box.add(data1);
                             data1.save();
                              Get.back();
                              Get.snackbar('', 'Congrulation');
                            } else {
                              // Handle the case when the entry already exists
                              print(
                                  '**********************************Entry already exists in the box.**********************************');
                              Get.snackbar('', 'Data Already Exits');
                            }
                            Get.back();
                          if(box.length<15){
                            _showDialog(context);
                          }

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
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return
          AlertDialog(
            title: Text('Remainder !',style: TextStyle(color: AppColor.purple),),
            content: Text('Do You Want to Add More Target ',style: TextStyle(color: AppColor.purple),),
            actions: <Widget>[
              TextButton(
                child: Text('Add Targets ',style: TextStyle(color: AppColor.orange),),
                onPressed: () {
                  Get.to(Add_target())?.then((value) =>   Navigator.of(context).pop());
                


                },
              ),
              TextButton(
                child: Text('Ask Me Later ',style: TextStyle(color: AppColor.green),),
                onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScheduleNotification()),
                ).then((value) =>     Navigator.of(context).pop());
            

                },
              ),
            ],
          );
      },

    );
  }

}

class Person {
  String name;

  Person(this.name);
}
