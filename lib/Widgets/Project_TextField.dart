import 'package:flutter/material.dart';

class App_TextField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final double? fieldheight;
  final int? maxline;
  final Function(String)? onChanged;
  String? Function(String?)? validator;

  TextEditingController controller = TextEditingController();

  App_TextField({
    required this.controller,
    this.validator,
    required this.hintText,
    this.labelText,
    this.fieldheight,
    this.onChanged,
    this.maxline}
      );

  // @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: fieldheight,
      child: TextFormField(
        validator: validator,
       maxLines: maxline,
        style: TextStyle(color: Colors.black),
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintStyle: TextStyle(color: Colors.black),
          labelText: labelText,
          hintText: hintText,
          // contentPadding: EdgeInsets.only(left: 0)

        ),
        onChanged: onChanged,
      ),
    );
  }
}
