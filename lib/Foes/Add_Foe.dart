import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:well_done/Foes/Foes_List.dart';
import 'package:well_done/Friends/Friends_list_view.dart';
import 'package:well_done/Targets/Targets_list_view.dart';
import 'package:well_done/Widgets/Button.dart';
import 'package:well_done/Widgets/Date_Time.dart';
import 'package:well_done/Widgets/Project_TextField.dart';
import 'package:well_done/Widgets/dropDown_Field.dart';

class Add_Foe_view extends StatefulWidget {
  const Add_Foe_view({Key? key}) : super(key: key);

  @override
  State<Add_Foe_view> createState() => _Add_Foe_viewState();
}

class _Add_Foe_viewState extends State<Add_Foe_view> {

  TextEditingController  NameController = TextEditingController();
  TextEditingController  DescriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 95),
          child: Text('Add Foe'),
        ),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                Text('Add Foe name',style: TextStyle(color: Colors.black),),
                SizedBox(height: 5,),
                App_TextField(hintText: 'Foe name',labelText: '',controller: NameController),
                SizedBox(height: 20,),
                Text('Add Description',style: TextStyle(color: Colors.black),),
                SizedBox(height: 5,),
                App_TextField(hintText: '',labelText: '',controller: DescriptionController, maxline: 10,fieldheight: 200),
                SizedBox(height: 20,),
                Text('Select Frequency',style: TextStyle(color: Colors.black),),
                SizedBox(height: 5,),
                TextFormField(
                  decoration: InputDecoration(
                    suffixIcon:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: dropDown(),
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 20,),
                Text('Pick Date & Time',style: TextStyle(color: Colors.black),),
                SizedBox(height: 5,),
                Date_Time(),
                SizedBox(height: 30,),
                Center(
                  child:AppButton(text: 'save',onPressed: (){Get.to(Foes_list_view());}),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
