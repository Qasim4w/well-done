import 'dart:async';

import 'package:animation_list/animation_list.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:well_done/Auth/login_screen.dart';
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




class _ProjectScreenState extends State<ProjectScreen> with TickerProviderStateMixin {

  Timer? timer;
  late AnimationController _controller;
  void initState() {
    super.initState();
    permission();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,


    );
    startTimer();
    // Other initialization code for the AnimationController
  }
  void permission()async{
    bool isallowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isallowed) {
      //no permission of local notification
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }
  void startTimer() {
    // Schedule the function to run every 5 minutes (300 seconds)
    timer = Timer.periodic(Duration(minutes: 20), (_) {
      updateOpacityForAll();
      print("Timeer call");
    });
  }


  @override
  void dispose() {
    _controller.dispose(); // Dispose of the AnimationController
    super.dispose();
    timer?.cancel();
  }
  String? nameDescription;
  // String? titleName;
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
    targetname=title!;
    // detailBoxVisibility=open!;
    c11=c1;
    c22=c2;
    close=closevalue;



  }
  void updateOpacityForAll() {
    final box = Hive.box<FriendsModel>('friends');
    final box1 = Hive.box<FoeModel>('foe');
    // Iterate over each item in the box
    for (int i = 0; i < box.length; i++) {
      final friend = box.get(i) as FriendsModel;

      // Update the opacity
      friend.Friendsopacity = 0.5;
      print('********************************${friend.Friendsopacity}Change from .9 ************************');

      // Save the updated target model to the box
      box.put(i, friend);
    }
    for (int i = 0; i < box1.length; i++) {
      final friend1 = box.get(i) as FoeModel;

      // Update the opacity
      friend1.opactiyFoe = 0.5;
      print('********************************${friend1.opactiyFoe}Change from .9 ************************');

      // Save the updated target model to the box
      box1.put(i, friend1);
    }
  }



  @override
  Widget build(BuildContext context) {
     // var provider = Provider.of<ProjectScreenProvider>(context);
    print("*************************rebuild*************************************rebuild***********************rebuild********************");
    return Scaffold(

      body: SafeArea(
        child: Consumer<ProjectScreenProvider>(builder: (context,provider,child){
          return  Stack(
            fit: StackFit.passthrough,
            children: [
              SunMoonScreen(),
              Positioned(
                right: 18.w,
                child: InkWell(onTap: (){
                  // provider.titleContainer=false;
                  provider.changeTitleContainer(false);

                  Get.to(TargetListScreen());
                },
                    child: Icon(Icons.settings_outlined,color: Colors.amber,size: 40.h,)),)
              ,
              Consumer<ProjectScreenProvider>(builder: (context,provider,child){
                return Padding(
                  padding:  EdgeInsets.only(top: 180.h),
                  child: Visibility(
                    visible: provider.leftFoe,
                    child: ValueListenableBuilder<Box<FoeModel>>(
                      valueListenable: Boxes.getFoe().listenable(),
                      builder: (context,box,_){
                        var data = box.values.toList().cast<FoeModel>();
                        return SizedBox(height: 300.h,width: 200.w,
                          child: ListView.builder(
                            itemCount:data.length,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return data[index].targetname==targetname? Column(crossAxisAlignment: CrossAxisAlignment.start
                                ,
                                children: [
                                  GestureDetector(onHorizontalDragStart: (value){
                                    // leftFoe=false;
                                    provider.changeLeftFoe(false);
                                    // rightFriends=false;
                                    provider.changeRightFoe(false);
                                    provider.changedetailBoxCentre(true);
                                    targetname=data[index].targetname;
                                    FoeName=data[index].foename;
                                    indexnumber=index;
                                    openBoxPlz(AppColor.orange, AppColor.yellow, data[index].targetname, data[index].foename, true,'left');


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
                                          side: BorderSide(color: AppColor.orange),
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
                );
              })
              ,
              Positioned(top: 10.h,left: 20.w,
                  child: InkWell(
                      onTap: (){Get.to(LoginScreen());},
                      child: Icon(Icons.login,size: 25.h,color: AppColor.orange,))),
              Positioned(top: 250.h,left: 50.w,right: 50.h,
                child: Visibility(
                  visible: provider.detailBoxCentre,
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
                       targetname.toString(),
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
                                  // detailBoxVisibility=false;
                                  provider.changedetailBoxCentre(false);
                                  if(close=='right'){
                                    // rightFriends=true;
                                    provider.changeRightFoe(true);

                                  }
                                  else{
                                    // leftFoe=true;
                                    provider.changeLeftFoe(true);
                                    // provider.changeLeftFoe(true);
                                  }



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
                                provider.changedetailBoxCentre(false);
                                // detailBoxVisibility=false;
                                if(close=='right'){
                                  final box=Boxes.getFriends();
                                  // rightFriends=true;
                                  provider.changeRightFoe(true);
                                  box.putAt(indexnumber, FriendsModel(friendsname: Friendsname.toString(), targetname: targetname.toString(),Friendsopacity: .9)  );


                                }
                                else{
                                  final box=Boxes.getFoe();
                                  // leftFoe=true;
                                  provider.changeLeftFoe(true);
                                  box.putAt(indexnumber, FoeModel(foename: FoeName.toString(), targetname: targetname.toString(),  opactiyFoe: .9) );

                                }


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
                visible: provider.rightFoe,
                child: ValueListenableBuilder<Box<FriendsModel>>(
                  valueListenable: Boxes.getFriends().listenable(),
                  builder: (context,box,_){
                    var data = box.values.toList().cast<FriendsModel>();
                    return SizedBox(height: 300.h,width: 200.w,
                      child: ListView.builder(
                        itemCount:data.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          // final helper = box.getAt(index) as FriendsModel;
                          print('**********************$targetname****************************');
                          print(data[index].targetname);
                         return data[index].targetname==targetname? Column(crossAxisAlignment: CrossAxisAlignment.end
                           ,
                           children: [
                             GestureDetector(onHorizontalDragStart: (value){

                               // leftFoe=false;
                               provider.changeRightFoe(false);
                               // rightFriends=false;
                               provider.changeLeftFoe(false);
                               targetname=data[index].targetname;
                               Friendsname=data[index].friendsname;
                               openBoxPlz(AppColor.Green, AppColor.greenlight, data[index].targetname, data[index].friendsname, true,'right');

                                  // centreSelected=true;
                                  // detailBoxVisibility=true;
                                  provider.changedetailBoxCentre(true);
                                  targetname=data[index].targetname;
                                  nameDescription=data[index].friendsname;
                                  indexnumber=index;
                                  // updateOpacityForAll();
                                  // selectedText=  provider.targetitems[index].name;

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
                                        side: BorderSide(color: AppColor.Green),
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
                visible: provider.centreBoxVisibility,

                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 175.h, horizontal: 120.w),
                  child: ValueListenableBuilder<Box<TargetModel>>(
                    valueListenable: Boxes.getData().listenable(),
                    builder: (context,box,_){
                      var data = box.values.toList().cast<TargetModel>();
                      return AnimationList(
                          duration: 3500,

                          physics: BouncingScrollPhysics(),
                          reBounceDepth: 60,
                          controller: ScrollController(keepScrollOffset: true),
                          children: data.map((item) {
                            return Column(
                              children: [
                                InkWell(onTap: (){
                                  // titleContainer=true;
                                  provider.changeTitleContainer(true);
                                  targetname=item.TargetName;
                                  // selectedText=  provider.targetitems[index].name;

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
                                        item.TargetName,
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
                          }).toList());


                    },
                  ),


                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 50.w,vertical: 60.h),
                child: Visibility(
                    visible: provider.titleContainer,

                    child:  Container(
                      width: 364.w,
                      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                      height: 100.h,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [AppColor.purple.withOpacity(.7), AppColor.lightpurple.withOpacity(.4)],
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1.5.w, color: AppColor.purple),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      child: Center(child: Text(targetname.toString(),style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.w800),)),
                    )

                ),
              ),



              Visibility(
                  visible: provider.titleContainer?false:true,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 70.w,vertical: 90.h),
                    child:!provider.centreBoxVisibility ? Text(
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
                visible: provider.titleContainer,
                child: Padding(
                  padding:  EdgeInsets.only(top: 500.h,left: 20.w,right: 20.w),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // red icon button
                      ButtonContainer(
                          onTap: (){
                        // leftFoe=!leftFoe;
                      //  provider.invertLeftFoe();

                        provider.changeLeftFoe(!provider.leftFoe);
                        print("******************************Hello Working******************************************");
                      // detailBoxVisibility=false;
                      provider.changedetailBoxCentre(false);
                      // print(provider.leftFoe);
                      if(provider.centreBoxVisibility==true){
                        // centreTarget=false;
                        provider.changeCentreTitleBox(false);

                      }
                      if(provider.leftFoe==true||provider.rightFoe==true){
                        // detailBoxVisibility=false;
                        provider.changedetailBoxCentre(false);
                      }


                      }, image: AppImages.leftButtonIcon, isOpened: provider.leftFoe, c1: AppColor.orange.withOpacity(.5), c2: AppColor.yellow.withOpacity(.5), border: AppColor.orange) ,
                      Spacer(),
                      ButtonContainer(onTap: (){
                        // rightFriends=!rightFriends;
                        provider.changeRightFoe(!provider.rightFoe);
                      // detailBoxVisibility=false;
                      provider.changedetailBoxCentre(false);
                      // print("******************************Hello   ******************************************");

                      if(provider.centreBoxVisibility==true){
                        // centreTarget=false;
                        provider.changeCentreTitleBox(false);
                        // detailBoxVisibility=false;
                        provider.changedetailBoxCentre(false);
                      }
                      if(provider.leftFoe==true||provider.rightFoe==true){
                        // detailBoxVisibility=false;
                        provider.changedetailBoxCentre(false);
                      }

                      }, image: AppImages.rightButtonIcon, isOpened: provider.rightFoe, c1: AppColor.Green.withOpacity(.5), c2: AppColor.greenlight.withOpacity(.5), border: AppColor.Green)
                    ],
                  ),
                ),
              ),
              Positioned(bottom: 30,left: 155,
                child: ButtonContainer(onTap: (){
                  // centreTarget=!centreTarget;
                  provider.changeCentreTitleBox(!provider.centreBoxVisibility);
                  // detailBoxVisibility=false;
                  provider.changedetailBoxCentre(false);

                  if(provider.leftFoe==true || provider.rightFoe==true){
                    // leftFoe=false;
                    provider.changeLeftFoe(false);
                    // rightFriends=false;
                    provider.changeRightFoe(false);
                    // detailBoxVisibility=false;
                    provider.changedetailBoxCentre(false);
                  }

                },border: AppColor.purple,image: AppImages.centreButtonIcon,c1: AppColor.purple.withOpacity(.5),c2: AppColor.lightpurple.withOpacity(.5),isOpened: provider.centreBoxVisibility,),
              ),

            ],
          );
        })

      ),
    );
  }


}
