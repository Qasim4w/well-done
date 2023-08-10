import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:well_done/DataLink/Streaming/Universal.dart';
import 'package:well_done/Widgets/Button.dart';
import 'package:well_done/notificationServices/notification_provider.dart';
import 'package:well_done/notificationServices/timeprovider.dart';
import 'package:well_done/utils/AppColor.dart';

class ReScheduleFriends extends StatelessWidget {
  ReScheduleFriends({super.key});
  NotificationWeekAndTime? pickedSchedule;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'When will we inform you to set your Friends please set Time ',textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 15.h,
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
                  c1: AppColor.Green,
                  c2: AppColor.greenlight,
                  border:AppColor.Green,
                  text: 'save',
                  onPressed: () async {

                    await NotificationService.showNotification(
                      title:
                      "${Emojis.person_role_health_worker} Remainder",
                      body: "please Set your Friends ِ",
                      scheduled: true,
                      notificationLayout: NotificationLayout.Default,
                      interval: 5,
                      // payload: {"navigate":"Friends"},
                      actionButtons: [
                        NotificationActionButton(key: 'Set Friends', label: 'Set Your Friends',actionType: ActionType.SilentAction,color: Colors.purple),
                    NotificationActionButton(key: 'Ask Me Later Friends', label: 'Ask Me Later ',actionType: ActionType.SilentAction,color: Colors.red,isDangerousOption: true

                    )],
                      notificationSchedule: pickedSchedule,
                    );
                    Get.back();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
