import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:well_done/Provider/loginProvider.dart';
import 'package:well_done/Provider/registeredProvider.dart';
import 'package:well_done/Widgets/Button.dart';
import 'package:well_done/Widgets/Project_TextField.dart';
import 'package:well_done/utils/AppColor.dart';

class RegisteredScreen extends StatelessWidget {
  RegisteredScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegisterProvider>(context);
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 50.h),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Name',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                App_TextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a You Name ';
                    }
                    return null; // Return null if the value is valid
                  },
                  hintText: 'Enter you Name ',
                  labelText: '',
                  controller: provider.nameController,
                  onChanged: (value) {},
                ),
                SizedBox(height: 10.h),
                Text(
                  'Email',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                App_TextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a Email ';
                    }
                    return null; // Return null if the value is valid
                  },
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Enter you Email ',
                  labelText: '',
                  controller: provider.emailController,
                  onChanged: (value) {},
                ),
                SizedBox(height: 10.h),
                Text(
                  'User Name',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                App_TextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a User name in Alpha Numeric Value  ';
                    }
                    return null; // Return null if the value is valid
                  },
                  hintText: 'Enter you Unique User name  ',
                  labelText: '',
                  controller: provider.usernameController,
                  onChanged: (value) {},
                ),
                SizedBox(height: 10.h),
                Text(
                  'Password',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                App_TextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password ';
                    }
                    return null; // Return null if the value is valid
                  },
                  hintText: 'Enter your Password',
                  labelText: '',
                  controller: provider.passwordController,
                  onChanged: (value) {},
                ),
                SizedBox(height: 10.h),
                Text(
                  'Password',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                App_TextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter  Confirm password ';
                    }
                    return null; // Return null if the value is valid
                  },
                  hintText: 'Enter your Confirm Password',
                  labelText: '',
                  controller: provider.confirmpasswordController,
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 15,
                ),
                provider.loading?Center(child: CircularProgressIndicator()) :   AppButton(onPressed: (){
                  if(_formKey.currentState!.validate()){
                    if(provider.passwordController.text== provider.confirmpasswordController.text){
                      provider.registerAPI(name: provider.nameController.text, username: provider.usernameController.text, email: provider.emailController.text, password: provider.passwordController.text);

                    }
                    else{
                      Get.snackbar('Error', 'Password And Confirm Password Not Match');
                    }

                       }





                },border: AppColor.purple,c2: AppColor.lightpurple,c1: AppColor.purple, text: 'Sign Up',)


              ],
            ),
          ),
        ),
      ),
    );
  }
}
