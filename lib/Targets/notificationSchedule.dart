import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:well_done/DataLink/Streaming/Universal.dart';
import 'package:well_done/Widgets/Button.dart';
import 'package:well_done/notificationServices/notification_provider.dart';
import 'package:well_done/notificationServices/timeprovider.dart';
import 'package:well_done/utils/AppColor.dart';

class ScheduleNotification extends StatelessWidget {
   ScheduleNotification({super.key});
  NotificationWeekAndTime? pickedSchedule;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
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

                  await NotificationService.showNotification(
                    title:
                    "${Emojis.activites_balloon} Remainder",
                    body: "please Set your Target ِ",
                    scheduled: true,
                    interval: 5,
                    // payload: {"navigate":"Target"},
                    actionButtons: [
                      NotificationActionButton(key: 'Set Notification', label: 'Set Target',actionType: ActionType.SilentAction,color: Colors.purple),
                      NotificationActionButton(key: 'Ask Me Later', label: 'Ask Me Later ',actionType: ActionType.SilentAction,color: Colors.red,isDangerousOption: true
                      )
                    ],
                    notificationSchedule: pickedSchedule,
                  );
                  Get.back();
                }),
          ),
        ],
      ),
    );
  }
}
