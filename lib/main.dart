import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:well_done/7Counter/7Counter.dart';
import 'package:well_done/Home_Screen/ProjectScreen.dart';
import 'package:get/get.dart';
import 'package:well_done/Provider/project_screen.dart';
import 'package:well_done/Provider/sunMoonScreenProvider.dart';
import 'package:well_done/Provider/targetScreenProvider.dart';
import 'package:well_done/models/foe_model.dart';
import 'package:well_done/models/friends_model.dart';
import 'package:well_done/models/target_model.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'Provider/foeProvider.dart';
import 'Provider/friendsprovider.dart';
import 'notificationServices/notification_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await NotificationService.initializeNotification();
  var directory = await  getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(TargetModelAdapter());
  Hive.registerAdapter(FriendsModelAdapter());
  Hive.registerAdapter(FoeModelAdapter());
  await Hive.openBox<TargetModel>('target');
  await Hive.openBox<FriendsModel>('friends');
  await Hive.openBox<FoeModel>('foe');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=>TargetProvider()),
            ChangeNotifierProvider(create: (_)=>FoeProvider()),
            ChangeNotifierProvider(create: (_)=>FriendsProvider()),
            ChangeNotifierProvider(create: (_)=>ProjectScreenProvider()),
            ChangeNotifierProvider(create: (_)=>SunMoonProvider()),
          ],
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: ProjectScreen(),
          ));


      },
    );
  }
}