
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:well_done/Home_Screen/ProjectScreen.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();



  bool _loading = false;
  bool get loading => _loading;
  Future<void> updateValue({required bool load}) async {
    _loading = load;
    notifyListeners();
  }
  void clearController(){
    passwordController.clear();
    emailController.clear();

  }

  Future<void> registerAPI({

    required String email,
    required String password,
  }) async {
    updateValue(load: true);

    try {
      final response = await http.post(
        Uri.parse('https://uaedubaivisa.com/welldone/welldone_project/public/api/login_user'),
        body: {

          'email': email,
          'password': password,
        },
      );
      print(
        "***********email******" +email+"****************************"

            +
            "*****************password ******" + password +
            "/n"

      );

//200
      if (response.statusCode == 200) {
        updateValue(load: false);
        // var jsonResponce = json.decode(response.body);
        // toast().toastmsg("Register Successfully", white);
        print(response.statusCode);
        Get.snackbar('Login Sucessfully', 'Welcome Back  ');
        Get.to(ProjectScreen());
        clearController();

        // Get.to(() => NavBar());
//401
      } else if (response.statusCode == 401) {
        updateValue(load: false);
        print(response.statusCode);
        Get.snackbar('Login Failed', 'Check Your Data ');
        // toast().toastmsg("The email has already been taken", white);
      } else {
        updateValue(load: false);
        print(response.statusCode);
        // toast().toastmsg("The username has already been taken", white);
      }
    } catch (e) {
      updateValue(load: false);
      // toast().toastmsg("Check Internet connection", white);
    }
  }
}