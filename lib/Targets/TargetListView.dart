import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:well_done/Foes/Add_Foe.dart';
import 'package:well_done/Foes/Foes_List.dart';
import 'package:well_done/Home_Screen/ProjectScreen.dart';
import 'package:well_done/Provider/UploadData%20to%20hive/uploadTargetData.dart';
import 'package:well_done/Provider/targetScreenProvider.dart';
import 'package:well_done/Widgets/Button.dart';
import 'package:well_done/boxes/boxes.dart';
import 'package:well_done/models/target_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:well_done/utils/AppColor.dart';

import '../Friends/Friends_list_view.dart';
import 'Add_target.dart';

class TargetListScreen extends StatelessWidget {
  const TargetListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TargetProvider>(context);
    var uploaddata =Provider.of<UploadTarget>(context);
    return SafeArea(
      child: Scaffold(backgroundColor: AppColor.lightpurple.withOpacity(.7),
        appBar: AppBar(backgroundColor:Colors.transparent,elevation: 0,
          title: Text('Targets'),centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back,color: AppColor.white,size: 40,),onPressed: (){Get.to(ProjectScreen());}),),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF8F94FB),
          onPressed: () {
            Get.to(Add_target());
          },
          child: Icon(Icons.add),
        ),
        body: ValueListenableBuilder<Box<TargetModel>>(
          valueListenable: Boxes.getData().listenable(),
          builder: (context, box, _) {
            var data = box.values.toList().cast<TargetModel>();
            return ListView.builder(
                itemCount: box.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  print("[[[[[[[[[[[[[[[[[[[[[[[[[[[[${index}]]]]]]]]]]]]]]]]]]]]]]]]]]]]");
                  uploaddata.registerAPI(targetName: data[index].TargetName, Targetdescription: data[index].Description, frequency: data[index].Description);
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Stack(
                      children: [
                        Container(
                          width: 364,
                          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),

                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.00, -1.00),
                              end: Alignment(0, 1),
                              colors: [Color(0xFF4E54C8).withOpacity(.5), Color(0xFF8F94FB).withOpacity(.7)],
                            ),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0xFF4E54C8)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                data[index].TargetName,
                                style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Futura Md BT',
                              fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                data[index].Description,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8999999761581421),
                                  fontSize: 16,
                                  fontFamily: 'Futura Bk BT',
                                  fontWeight: FontWeight.w400,

                                ),
                              ),
                              Text(data[index].Time,style: TextStyle(
                                color: Colors.white.withOpacity(0.8999999761581421),
                                fontSize: 16,
                                fontFamily: 'Futura Bk BT',
                                fontWeight: FontWeight.w400,),),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: AppButton(
                                      c1: Color(0xFFFC4A1A),
                                      c2: Color(0xFFF7B733),
                                      width: 150.w,
                                      border: Color(0xFFFC4A1A),
                                      onPressed: () {
                                        Get.to(FoeListScreen(
                                            targetName: data[index].TargetName));
                                      },
                                      text: 'Foe',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  AppButton(
                                    c1: Color(0xFF11998E),
                                    width: 150.w,
                                    c2:  Color(0xFF38EF7D),
                                    border: Color(0xFF11998E),
                                    onPressed: () {
                                      Get.to(FriendsListScreen(
                                          targetName: data[index].TargetName));
                                    },
                                    text: 'Friends',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 290.w, top: 5.h),
                          child: InkWell(
                              onTap: () {

                              _showDialog(context, data[index]);
                              },
                              child: Icon(Icons.highlight_remove_rounded,color: AppColor.white,)),
                        )
                      ],
                    ),
                  );
                });
          },
        ),
      ),
    );
  }

  void delete(TargetModel targetModel) async {
    await targetModel.delete();

  }
  void _showDialog(BuildContext context,TargetModel targetModel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return
          AlertDialog(
          title: Text('Delete !',style: TextStyle(color: AppColor.purple),),
          content: Text('Are you Sure to Delete Your Target',style: TextStyle(color: AppColor.purple),),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel',style: TextStyle(color: AppColor.orange),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK',style: TextStyle(color: AppColor.green),),
              onPressed: () {
                delete(targetModel);
                // Perform some action

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },

    );
  }
}
