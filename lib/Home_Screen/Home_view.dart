import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:well_done/Practice%20Code/Practice.dart';

class Home_view extends StatefulWidget {
  const Home_view({Key? key}) : super(key: key);

  @override
  State<Home_view> createState() => _Home_viewState();
}

class _Home_viewState extends State<Home_view> {
  late String sending;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

        ],
      ),
    );
  }
}
