import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {

  String text;
  final VoidCallback onPressed;
  AppButton({required this.text,required this.onPressed});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50,vertical: 15)),
          backgroundColor: MaterialStateProperty.all(Colors.amber)),
      onPressed: widget.onPressed,
      child: Text(widget.text,style: TextStyle(color: Colors.black),),
    );
  }
}
