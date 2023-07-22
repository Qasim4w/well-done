import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:well_done/Home_Screen/ProjectScreen.dart';
import 'package:http/http.dart' as http;
import 'package:well_done/models/target_model.dart';

class UploadTarget with ChangeNotifier{



  Future<void> registerAPI({

    required String targetName,
    required String Targetdescription,
    required String frequency,
  }) async {


    try {
      var headers = {
        'Authorization': 'Bearer 17|YugXPHU7x34dms5qxjX1ryJzxz3Ecv7rmHhFxLPf'
      };
      var request = http.MultipartRequest('POST', Uri.parse('https://uaedubaivisa.com/welldone/welldone_project/public/api/targets_post'));
      request.fields.addAll({
        'user_id': '1',
        'target_name': targetName,
        'target_description': Targetdescription,
        'target_frequency': frequency,
        'target_datetime': '2023-07-18 04:12',
        'status': '1'
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      }
      else {
        print(response.reasonPhrase);
      }

    } catch (e) {

      // toast().toastmsg("Check Internet connection", white);
    }
  }
}