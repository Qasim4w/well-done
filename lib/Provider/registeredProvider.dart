import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:well_done/Auth/login_screen.dart';

class RegisterProvider with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  bool _loading = false;
  bool get loading => _loading;
  Future<void> updateValue({required bool load}) async {
    _loading = load;
    notifyListeners();
  }
  void clearController(){
    passwordController.clear();
    // emailController.clear();
    confirmpasswordController.clear();
    usernameController.clear();
    nameController.clear();

  }

  Future<void> registerAPI({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    updateValue(load: true);

    try {
      final response = await http.post(
        Uri.parse('https://uaedubaivisa.com/welldone/welldone_project/public/api/users_post'),
        body: {
          'name': nameController.text,
          'username': usernameController.text,
          'email': emailController.text,
          'password': passwordController.text,
        },
      );
      print(
        "NAME******" +
            name +
            "/n" +
            "userNAME******" +
            username +
            "/n" +
            "Email******" +
            email +
            "/n" +
            "Password******" +
            password,
      );

//200
      if (response.statusCode == 200) {
        updateValue(load: false);
  
        print(response.statusCode);
        Get.snackbar('Hello', 'Welcome to Guess Chat Kindly Login to Start');
        Get.to(LoginScreen(controller: emailController,));
        clearController();

        // Get.to(() => NavBar());
//401
      } else if (response.statusCode == 401) {
        updateValue(load: false);
        print(response.statusCode);
        Get.snackbar('Sorry', 'The email has already been taken');
        // toast().toastmsg("", white);
      } else {
        updateValue(load: false);
        print(response.statusCode);
        Get.snackbar('Hello', 'Sorry Register Again ');
        // toast().toastmsg("The username has already been taken", white);
      }
    } catch (e) {
      updateValue(load: false);
      // toast().toastmsg("Check Internet connection", white);
    }
  }
}