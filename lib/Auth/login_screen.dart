import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:well_done/Auth/signup_screen.dart';
import 'package:well_done/Provider/loginProvider.dart';
import 'package:well_done/Provider/registeredProvider.dart';
import 'package:well_done/Widgets/Button.dart';
import 'package:well_done/Widgets/Project_TextField.dart';
import 'package:well_done/utils/AppColor.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key, this.controller});
   TextEditingController?controller;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    final registeredProvider =Provider.of<RegisterProvider>(context);
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                hintText: 'Enter you Email ',
                keyboardType: TextInputType.emailAddress,
                labelText: '',

                controller:controller?? provider.emailController,
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
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){}, child: Text('Forget Password')),
                ],
              ),
              SizedBox(
                height: 15,
              ),
           provider.loading?Center(child: CircularProgressIndicator()) :   AppButton(onPressed: (){
                 if(_formKey.currentState!.validate()){
                    provider.registerAPI(email:controller?.text?? provider.emailController.text, password: provider.passwordController.text).then((value) =>   registeredProvider.emailController.clear());
                 }





              },border: AppColor.purple,c2: AppColor.lightpurple,c1: AppColor.purple, text: 'Sign In',),

              SizedBox(
                height: 15,
              ),
              Row(children: [
                Text('Want to Registered Your Account ?',style: TextStyle(color: Colors.black),),TextButton(onPressed: (){Get.to(RegisteredScreen());}, child: Text("Click here "))
              ],)













            ],
          ),
        ),
      ),
    );
  }
}
