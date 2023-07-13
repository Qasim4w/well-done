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
import 'package:well_done/utils/AppColor.dart';

import '../Targets/TargetListView.dart';
import '../Provider/foeProvider.dart';
import '../models/foe_model.dart';

class Add_Foe extends StatefulWidget {
  String Targetname;
   Add_Foe({Key? key,required this.Targetname}) : super(key: key);

  @override
  State<Add_Foe> createState() => _Add_FoeState();
}

class _Add_FoeState extends State<Add_Foe> {



  String _name = '';
  GlobalKey<FormState> _key =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<FoeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 95),
          child: Text('Foe Details'),
        ),
        backgroundColor: Colors.deepOrange,
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
                    'Add Foe name',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  App_TextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Foe name';
                      }
                      return null; // Return null if the value is valid
                    },
                    hintText: 'Foe name',
                    labelText: '',

                    controller: provider.FoeName,
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
                        child: Consumer<TargetProvider>(
                          builder: (context, TargetProvider, _) => Container(
                            padding: EdgeInsets.all(10),
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                TargetProvider.date,
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
                        c1: Color(0xFFFC4A1A),
                        c2: Color(0xFFF7B733),
                        border: Color(0xFFFC4A1A),
                        text: 'save',
                        onPressed: () {
                          if(_key.currentState!.validate()){
                            final data =FoeModel(foename: provider.FoeName.text.toString(),targetname:widget.Targetname,opactiyFoe: .4);
                            final box=Boxes.getFoe();
                            final existingIndex = box.values.cast<FoeModel>().toList().indexWhere(
                                  (foes) =>
                                  foes.foename == data.foename &&
                                  foes.targetname == data.targetname,
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

                            provider.controllerClear();
                            Get.snackbar('', 'Foe add Successfully  ');

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


