import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:well_done/Home_Screen/SunMoon.dart';
import 'package:well_done/Home_Screen/components/button_container.dart';
import 'package:well_done/Provider/project_screen.dart';
import 'package:well_done/Provider/targetScreenProvider.dart';
import 'package:well_done/boxes/boxes.dart';
import 'package:well_done/models/foe_model.dart';
import 'package:well_done/models/friends_model.dart';
import 'package:well_done/models/target_model.dart';
import 'package:well_done/utils/AppColor.dart';
import 'package:well_done/utils/AppImages.dart';

import '../Targets/TargetListView.dart';
import '../Widgets/Button.dart';



class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}




class _ProjectScreenState extends State<ProjectScreen> with SingleTickerProviderStateMixin {

  bool leftFoe = false;
  bool rightFriends = false;
  bool centreTarget=false;


  bool titleContainer =false;
  bool detailBoxVisibility =false;

  // bool centreSelected=false;


  // String? Variable;
  // String? Data;
  String? nameDescription;
  String? titleName;
  String?close;
  Color c11=Color(0xff0000);
  Color c22 = Color(0xff0000);
  // bool Clikbutton = true;
  String? targetname;
  String? Friendsname;
  String? FoeName;
  int indexnumber=0;
  void openBoxPlz(Color c1,Color c2,String title,String Description ,bool open,String closevalue){
    nameDescription=Description!;
    titleName=title!;
    detailBoxVisibility=open!;
    c11=c1;
    c22=c2;
    close=closevalue;



  }

  @override
  Widget build(BuildContext context) {
     // var provider = Provider.of<ProjectScreenProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            SunMoonScreen(),
            Positioned(
              right: 18.w,
              child: InkWell(onTap: (){
            titleContainer=false;

            Get.to(TargetListScreen());
            },
                      child: Icon(Icons.settings_outlined,color: Colors.amber,size: 40.h,)),)
            ,
            Padding(
              padding:  EdgeInsets.only(top: 180.h),
              child: GestureDetector(
                onHorizontalDragStart: (Detail){
                  leftFoe=true;

                },
                child:  Visibility(
                  visible: leftFoe,
                  child: ValueListenableBuilder<Box<FoeModel>>(
                    valueListenable: Boxes.getFoe().listenable(),
                    builder: (context,box,_){
                      var data = box.values.toList().cast<FoeModel>();
                      return SizedBox(height: 300.h,width: 200.w,
                        child: ListView.builder(
                          itemCount:data.length,
                          itemBuilder: (context, index) {
                            return data[index].targetname==targetname? Column(crossAxisAlignment: CrossAxisAlignment.start
                              ,
                              children: [
                                InkWell(onTap: (){
                                  leftFoe=false;
                                  // provider.changeLeftFoe(false);
                                  rightFriends=false;
                                  targetname=data[index].targetname;
                                  FoeName=data[index].foename;
                                  indexnumber=index;
                                  openBoxPlz(AppColor.orange, AppColor.yellow, data[index].targetname, data[index].foename, true,'left');

                                  setState(() {

                                  });
                                },
                                  child: Container(
                                    width: 150.w,
                                    height: 50.h,padding: EdgeInsets.only(right: 10.w),
                                    decoration: ShapeDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment(0.00, -1.00),
                                        end: Alignment(0, 1),
                                        colors: [AppColor.orange.withOpacity(data[index].opactiyFoe), AppColor.yellow.withOpacity(data[index].opactiyFoe)
                                        ],
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(50.r),
                                          bottomRight: Radius.circular(50.r),
                                        ),
                                      ),
                                    ),


                                    child: Center(
                                      child: Text(
                                        data[index].foename,overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.white, fontSize: 17.sp),
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 15.h,),



                              ],
                            ):SizedBox.shrink();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Positioned(top: 250.h,left: 50.w,right: 50.h,
              child: Visibility(
                visible: detailBoxVisibility,
                child:  Container(


                padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),

                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [c11.withOpacity(.2), c22.withOpacity(.5)],
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1, color: c11),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      titleName.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Futura Md BT',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      nameDescription.toString(),
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8999999761581421),
                        fontSize: 16.sp,
                        fontFamily: 'Futura Bk BT',
                        fontWeight: FontWeight.w400,

                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AppButton(
                            c1:  c11.withOpacity(.9),
                            c2:   c22.withOpacity(.2),
                            width: 150.w,
                            border: c11,
                            onPressed: () {
                              print('***************************$close**********************');
                                detailBoxVisibility=false;
                                if(close=='right'){
                                  rightFriends=true;

                                }
                                else{
                                  leftFoe=true;
                                  // provider.changeLeftFoe(true);
                                }

                                setState(() {

                                });

                            },
                            text: 'Cancel',
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        AppButton(
                          c1: c11,
                          width: 100.w,
                          c2:  c22,
                          border: c11.withOpacity(.3),
                          onPressed: () async{
                            detailBoxVisibility=false;
                            if(close=='right'){
                              final box=Boxes.getFriends();
                              rightFriends=true;
                              box.putAt(indexnumber, FriendsModel(friendsname: Friendsname.toString(), targetname: targetname.toString(),Friendsopacity: .9)  );


                            }
                            else{
                              final box=Boxes.getFoe();
                              leftFoe=true;
                              // provider.changeLeftFoe(true);
                              box.putAt(indexnumber, FoeModel(foename: FoeName.toString(), targetname: targetname.toString(),  opactiyFoe: .9) );

                            }
                            setState(() {

                            });

                          },
                          text: 'Join',
                        ),
                      ],
                    ),
                  ],
                ),
              ), ),
            ),

            Padding(
              padding:  EdgeInsets.only(top:180.h,left:220.w ),
              child: Visibility(
                visible: rightFriends,
                child: ValueListenableBuilder<Box<FriendsModel>>(
                  valueListenable: Boxes.getFriends().listenable(),
                  builder: (context,box,_){
                    var data = box.values.toList().cast<FriendsModel>();
                    return SizedBox(height: 300.h,width: 200.w,
                      child: ListView.builder(
                        itemCount:data.length,
                        itemBuilder: (context, index) {
                          // final helper = box.getAt(index) as FriendsModel;
                          print('**********************$targetname****************************');
                          print(data[index].targetname);
                         return data[index].targetname==targetname? Column(crossAxisAlignment: CrossAxisAlignment.end
                           ,
                           children: [
                             InkWell(onTap: (){

                               leftFoe=false;
                               rightFriends=false;
                               targetname=data[index].targetname;
                               Friendsname=data[index].friendsname;
                               openBoxPlz(AppColor.Green, AppColor.greenlight, data[index].targetname, data[index].friendsname, true,'right');

                               // centreSelected=true;
                               detailBoxVisibility=true;
                               titleName=data[index].targetname;
                               nameDescription=data[index].friendsname;
                               indexnumber=index;
                               // selectedText=  provider.targetitems[index].name;
                               setState(() {

                               });
                             },
                               child: Container(
                                 width: 150.w,
                                 height: 50.h,
                                 padding: EdgeInsets.only(left: 10.w),
                                 decoration: ShapeDecoration(
                                   gradient: LinearGradient(
                                     begin: Alignment(0.00, -1.00),
                                     end: Alignment(0, 1),
                                     colors: [AppColor.Green.withOpacity(data[index].Friendsopacity), AppColor.greenlight.withOpacity(data[index].Friendsopacity)],
                                   ),
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.only(
                                       topLeft: Radius.circular(50.r),
                                       bottomLeft: Radius.circular(50.r),
                                     ),
                                   ),
                                 ),

                                 child: Center(
                                   child: Text(
                                     data[index].friendsname,overflow: TextOverflow.ellipsis,
                                     style: TextStyle(color: Colors.white, fontSize: 17.sp),
                                   ),
                                 ),
                               ),
                             ),

                             SizedBox(height: 15.h,),



                           ],
                         ):SizedBox.shrink();



    },
                      ),
                    );
                  },
                ),
              ),
            ),
          Visibility(
            visible: centreTarget,

            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 180.h, horizontal: 120.w),
              child: ValueListenableBuilder<Box<TargetModel>>(
                valueListenable: Boxes.getData().listenable(),
                builder: (context,box,_){
                  var data = box.values.toList().cast<TargetModel>();
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(onTap: (){
                       titleContainer=true;
                       targetname=data[index].TargetName;
                        // selectedText=  provider.targetitems[index].name;
                        setState(() {

                        });
                      },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              width: 311.w,
                              height: 50.h,
                              decoration: ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.00, -1.00),
                                  end: Alignment(0, 1),
                                  colors: [Color(0xFF4E54C8).withOpacity(.5), Color(0xFF8F94FB).withOpacity(.2)],
                                ),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 0.50, color: Color(0xFF4E54C8)),
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                              ),
                              child:  Center(
                                child: Text(
                                  data[index].TargetName,
                                  overflow: TextOverflow.ellipsis,
                                  style:TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontFamily: 'Futura Md BT',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 5.h),
                        ],
                      );
                    },
                  );
                },
              ),


            ),
          ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 50.w,vertical: 60.h),
              child: Visibility(
                visible: titleContainer,

                child:  Container(
                  width: 364.w,
                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                  height: 100.h,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [AppColor.purple.withOpacity(.5), AppColor.lightpurple.withOpacity(.4)],
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1.w, color: c11),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: Center(child: Text(targetname.toString(),style: TextStyle(fontSize: 20.sp),)),
                )

              ),
            ),



          Visibility(
            visible: titleContainer?false:true,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 70.w,vertical: 90.h),
                child:!centreTarget ? Text(
                  'Click the button below to Continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ):Text(
                  'Select the Target  to Continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )),

            Visibility(
              visible: titleContainer,
              child: Padding(
                padding:  EdgeInsets.only(top: 500.h,left: 20.w,right: 20.w),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // red icon button
                    ButtonContainer(onTap: (){leftFoe=!leftFoe;
                    detailBoxVisibility=false;
                    if(centreTarget==true){
                      centreTarget=false;

                    }
                    if(leftFoe==true||rightFriends==true){
                      detailBoxVisibility=false;
                    }

                    setState(() {});
                    }, image: AppImages.leftButtonIcon, isOpened: leftFoe, c1: AppColor.orange.withOpacity(.5), c2: AppColor.yellow.withOpacity(.5), border: AppColor.orange) ,
                   Spacer(),
                    ButtonContainer(onTap: (){rightFriends=!rightFriends;
                    detailBoxVisibility=false;
                    if(centreTarget==true){
                      centreTarget=false;
                      detailBoxVisibility=false;
                    }
                    if(leftFoe==true||rightFriends==true){
                      detailBoxVisibility=false;
                    }
                    setState(() {});
                    }, image: AppImages.rightButtonIcon, isOpened: rightFriends, c1: AppColor.Green.withOpacity(.5), c2: AppColor.greenlight.withOpacity(.5), border: AppColor.Green)
                  ],
                ),
              ),
            ),
            Positioned(bottom: 30,left: 155,
              child: ButtonContainer(onTap: (){
                centreTarget=!centreTarget;
                detailBoxVisibility=false;

                if(leftFoe==true || rightFriends==true){
                  leftFoe=false;
                  rightFriends=false;
                  detailBoxVisibility=false;
                }
                setState(() {});
              },border: AppColor.purple,image: AppImages.centreButtonIcon,c1: AppColor.purple.withOpacity(.5),c2: AppColor.lightpurple.withOpacity(.5),isOpened: centreTarget,),
            ),

          ],
        ),
      ),
    );
  }


}
