import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:well_done/Home_Screen/SunMoon.dart';
import 'package:well_done/Practice%20Code/Practice.dart';
import 'package:well_done/Targets/Targets_list_view.dart';
import 'package:well_done/Targets/Add_target.dart';


class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}




class _ProjectScreenState extends State<ProjectScreen> with SingleTickerProviderStateMixin {

  bool left = false;
  bool right = false;
  bool show=false;

  String var1="Muhammad Maaz \n hhhhhhhhhhhhhhhhhhhhhhhhhh\nhhhhhhhhhhhhhhhhhhhhhhh";
  String var2="Sajjad Ali";
  String var3="Waleed Khan";
  String var4="Jabbar Kakkar";
  String var5="Khalid Khan";


  String Variable="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            SunMoonScreen(),
            Positioned(
              right: 18,
              child: IconButton(
                  onPressed: (){
                    Get.to(Targets_list_view());
                  },
                  icon: Icon(Icons.settings_outlined,color: Colors.amber,size: 40,),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: left,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 160),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){

                                    if(show==false){
                                      Variable=var1;
                                      show=true;}
                                    else if(show==true){
                                      Variable="";show=false;
                                    }
                                    setState(() {

                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50))
                                    ),
                                    child: Center(
                                      child: Text(
                                        var1,overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.white, fontSize: 17),
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 5,),
                                GestureDetector(
                                  onTap: (){

                                    if(show==false){
                                      Variable=var2;
                                      show=true;}
                                    else if(show==true){Variable="";show=false;}
                                    setState(() {

                                    });
                                  },child:
                                Container(
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50))
                                  ),
                                  child: Center(
                                    child: Text(
                                      var2,overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.white, fontSize: 17),
                                    ),
                                  ),
                                ),
                                ),

                                SizedBox(height: 5,),
                                GestureDetector(
                                  onTap: (){

                                    if(show==false){
                                      print("${show}");
                                      Variable=var3;
                                      show=true;}
                                    else if(show==true){Variable="";show=false;print("bbbb");}
                                    setState(() {

                                    });
                                  },child:
                                Container(
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50))
                                  ),
                                  child: Center(
                                    child: Text(
                                      var3,overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.white, fontSize: 17),
                                    ),
                                  ),
                                ),
                                ),

                                SizedBox(height: 5,),
                                GestureDetector(
                                  onTap: (){
                                    if(show==false){
                                      print("${show}");
                                      Variable=var4;
                                      show=true;}
                                    else if(show==true){Variable="";show=false;print("bbbb");}
                                    setState(() {

                                    });
                                  },child:
                                Container(
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50))
                                  ),
                                  child: Center(
                                    child: Text(
                                      var4,overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.white, fontSize: 17),
                                    ),
                                  ),
                                ),
                                ),

                                SizedBox(height: 5,),
                                GestureDetector(
                                  onTap: (){
                                    if(show==false){
                                      print("${show}");
                                      Variable=var5;
                                      show=true;}
                                    else if(show==true){Variable="";show=false;print("bbbb");}
                                    setState(() {

                                    });
                                  },child:
                                Container(
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50))
                                  ),
                                  child: Center(
                                    child: Text(
                                      var5,overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.white, fontSize: 17),
                                    ),
                                  ),
                                ),
                                ),

                              ],
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: right,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 160),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){

                                    if(show==false){
                                      print("${show}");
                                      Variable=var1;
                                      show=true;}
                                    else if(show==true){Variable="";show=false;print("bbbb");}
                                    setState(() {

                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50))
                                    ),
                                    child: Center(
                                      child: Text(
                                        var1,overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.white, fontSize: 17),
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 5,),
                                GestureDetector(
                                  onTap: (){

                                    if(show==false){
                                      print("${show}");
                                      Variable=var2;
                                      show=true;}
                                    else if(show==true){Variable="";show=false;print("bbbb");}
                                    setState(() {

                                    });
                                  },child:
                                Container(
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),topLeft: Radius.circular(50))
                                  ),
                                  child: Center(
                                    child: Text(
                                      var2,overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.white, fontSize: 17),
                                    ),
                                  ),
                                ),
                                ),

                                SizedBox(height: 5,),
                                GestureDetector(
                                  onTap: (){

                                    if(show==false){
                                      print("${show}");
                                      Variable=var3;
                                      show=true;}
                                    else if(show==true){Variable="";show=false;print("bbbb");}
                                    setState(() {

                                    });
                                  },child:
                                Container(
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),topLeft: Radius.circular(50))
                                  ),
                                  child: Center(
                                    child: Text(
                                      var3,overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.white, fontSize: 17),
                                    ),
                                  ),
                                ),
                                ),

                                SizedBox(height: 5,),
                                GestureDetector(
                                  onTap: (){
                                    if(show==false){
                                      print("${show}");
                                      Variable=var4;
                                      show=true;}
                                    else if(show==true){Variable="";show=false;print("bbbb");}
                                    setState(() {

                                    });
                                  },child:
                                Container(
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),topLeft: Radius.circular(50))
                                  ),
                                  child: Center(
                                    child: Text(
                                      var4,overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.white, fontSize: 17),
                                    ),
                                  ),
                                ),
                                ),

                                SizedBox(height: 5,),
                                GestureDetector(
                                  onTap: (){
                                    if(show==false){
                                      print("${show}");
                                      Variable=var5;
                                      show=true;}
                                    else if(show==true){Variable="";show=false;print("bbbb");}
                                    setState(() {

                                    });
                                  },child:
                                Container(
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),topLeft: Radius.circular(50))
                                  ),
                                  child: Center(
                                    child: Text(
                                      var5,overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.white, fontSize: 17),
                                    ),
                                  ),
                                ),
                                ),

                              ],
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 90, top: 290),
              child: Container(
                height: 300,
                width: 250,
                decoration: BoxDecoration(
                  // color: Colors.white
                ),
                child: Center(
                  child: Text(
                    Variable,
                    style: TextStyle(color: Colors.red, fontSize: 25),
                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(top: 600),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // red icon button
                  IconButton(
                      onPressed: (){left=!left;
                        setState(() {});
                        }, icon: Icon(Icons.menu,color: Colors.red,size: 50,)),
                  // green icon button
                  SizedBox(width: 270,),
                  IconButton(onPressed: (){right=!right;
                  setState(() {});
                  }, icon: Icon(Icons.menu,color: Colors.green,size: 50,)),
                ],
              ),
            ),
            Positioned(bottom: 30,left: 165,
              child: IconButton(
                  onPressed: (){
                  setState(() {});
                  }, icon: Icon(Icons.menu,color: Colors.purple,size: 50,)),
            ),

          ],
        ),
      ),
    );
  }
}
