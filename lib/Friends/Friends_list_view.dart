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
import 'package:well_done/models/friends_model.dart';
import 'package:well_done/utils/AppColor.dart';
import 'package:well_done/utils/AppImages.dart';

import '../Provider/foeProvider.dart';
import '../Targets/Add_target.dart';

class FriendsListScreen extends StatelessWidget {
  final String targetName;

  FriendsListScreen({super.key, required this.targetName});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FoeProvider>(context);
    print(targetName);
    return SafeArea(

      child: Scaffold(backgroundColor: AppColor.green.withOpacity(.5),
        appBar: AppBar(backgroundColor:Colors.transparent,elevation: 0,
          title: Text('Friends'),centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back,color: AppColor.white,size: 40,),onPressed: (){Get.back();}),),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.greenlight.withOpacity(.7),
          onPressed: () {
            Get.to(Add_Friends(Targetname: targetName));
          },
          child: Icon(Icons.add),
        ),
        body:ValueListenableBuilder<Box<FriendsModel>>(
          valueListenable:Boxes.getFriends().listenable(),
          builder: (context,box,_){
            var data = box.values.toList().cast<FriendsModel>();
            return  Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  if (data[index].targetname== targetName) {
                    print(data[index].targetname+"Qasim");
                    print(targetName+"hello");
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
                                colors: [Color(0xFF11998E).withOpacity(.5), Color(0xFF38EF7D).withOpacity(.5)],
                              ),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Color(0xFF11998E)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: Text(
                  data[index].friendsname,
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
                            padding:  EdgeInsets.only(right: 15.w,top: 10.h),
                            child: InkWell(onTap: (){
                              _showDialog(context, data[index]);
                            },
                                child: Image.asset(AppImages.cross,height: 15.h,width: 15.w)),
                          ),
                        ],

                      ));
                  } else {
                    return SizedBox.shrink(); // Return an empty widget if target names don't match
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
  void delete(FriendsModel friendsmodel) async {
    await friendsmodel.delete();
  }
  void _showDialog(BuildContext context,FriendsModel friendsModel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return
          AlertDialog(
            title: Text('Delete !',style: TextStyle(color: AppColor.purple),),
            content: Text('Are you Sure to Delete Your Friends',style: TextStyle(color: AppColor.purple),),
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
                  delete(friendsModel);
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
