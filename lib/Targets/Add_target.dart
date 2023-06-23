import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:well_done/Targets/Targets_list_view.dart';
import 'package:well_done/Widgets/Button.dart';
import 'package:well_done/Widgets/Date_Time.dart';
import 'package:well_done/Widgets/Project_TextField.dart';
import 'package:well_done/Widgets/dropDown_Field.dart';

class Add_target extends StatefulWidget {
  const Add_target({Key? key}) : super(key: key);

  @override
  State<Add_target> createState() => _Add_targetState();
}

class _Add_targetState extends State<Add_target> {

  TextEditingController NameController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
  List<Person> items = [];
  String _name = '';

  @override
  Widget build(BuildContext context) {
    Map<String,String> dataMap={
      'name':NameController.text.toString(),
      'description':DescriptionController.text.toString(),

    };
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 95),
          child: Text('Target'),
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
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Add target name',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                App_TextField(
                  hintText: 'Target name',
                  labelText: '',
                  controller: NameController,
                  onChanged: (value) {
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Add Description',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                App_TextField(
                    hintText: '',
                    labelText: '',
                    controller: DescriptionController,
                    maxline: 10,
                    fieldheight: 200),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Add Frequency',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: dropDown(),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
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
                Date_Time(),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: AppButton(
                      text: 'save',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Targets_list_view()),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Person {
  String name;

  Person(this.name);
}
