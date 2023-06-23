import 'package:flutter/material.dart';

class App_TextField extends StatefulWidget {
  final String hintText;
  final String? labelText;
  final double? fieldheight;
  final int? maxline;
  final Function(String)? onChanged;

  TextEditingController controller = TextEditingController();

  App_TextField({
    required this.controller,
    required this.hintText,
    this.labelText,
    this.fieldheight,
    this.onChanged,
    this.maxline}
      );

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<App_TextField> {

  // @override
  // void initState() {
  //   super.initState();
  //   controller = TextEditingController();
  // }
  //
  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.fieldheight,
      child: TextFormField(
       maxLines: widget.maxline,
        style: TextStyle(color: Colors.black),
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintStyle: TextStyle(color: Colors.black),
          labelText: widget.labelText,
          hintText: widget.hintText,
          // contentPadding: EdgeInsets.only(left: 0)

        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
