import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:well_done/Foes/Add_Foe.dart';
import 'package:well_done/Friends/Add_Friends.dart';
import 'package:well_done/Provider/targetScreenProvider.dart';
import 'package:well_done/boxes/boxes.dart';
import 'package:well_done/models/foe_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:well_done/utils/AppColor.dart';
import 'package:well_done/utils/AppImages.dart';

import '../Provider/foeProvider.dart';
import '../Targets/Add_target.dart';

class FoeListScreen extends StatelessWidget {
  final String targetName;

  FoeListScreen({super.key, required this.targetName});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FoeProvider>(context);
    print(targetName);
    return SafeArea(
      child: Scaffold(backgroundColor:AppColor.orangeB.withOpacity(.4),
        appBar: AppBar(backgroundColor:Colors.transparent,elevation: 0,
          title: Text('Foes'),centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back,color: AppColor.white,size: 40,),onPressed: (){Get.back();}),),
        floatingActionButton: FloatingActionButton(backgroundColor: AppColor.orange.withOpacity(.8),
          onPressed: () {
            Get.to(Add_Foe(Targetname: targetName));
          },
          child: Icon(Icons.add),
        ),
        body:ValueListenableBuilder<Box<FoeModel>>(
          valueListenable:Boxes.getFoe().listenable(),
          builder: (context,box,_){
            var data = box.values.toList().cast<FoeModel>();
            return  Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  if (data[index].targetname== targetName) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Stack(alignment: Alignment.topRight,
                        children: [
                          Container(
                            width: 364,

                            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h),

                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.00, -1.00),
                                end: Alignment(0, 1),
                                colors: [AppColor.orange.withOpacity(.5), AppColor.yellow.withOpacity(.5)],
                              ),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: AppColor.orange),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                data[index].foename,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontFamily: 'Futura Md BT',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(right: 10.w,top: 10.h),
                            child: InkWell(onTap: (){
                              _showDialog(context, data[index]);
                            },
                                child: Image.asset(AppImages.cross,height: 15.h,width: 15.w)),
                          ),

                        ],
                      ),
                    );
                  } else {
                    return
                      SizedBox.shrink(); // Return an empty widget if target names don't match
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
  void delete(FoeModel foesmodel) async {
    await foesmodel.delete();
  }
  void _showDialog(BuildContext context,FoeModel foesModel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return
          AlertDialog(
            title: Text('Delete !',style: TextStyle(color: AppColor.purple),),
            content: Text('Are you Sure to Delete Your Foe',style: TextStyle(color: AppColor.purple),),
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
                  delete(foesModel);
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
