import 'package:flutter/material.dart';
import 'package:well_done/utils/AppColor.dart';

class App_TextField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final double? fieldheight;
  final int? maxline;
  TextInputType? keyboardType;
  final Function(String)? onChanged;
  String? Function(String?)? validator;
  final Color? focusColor;

  TextEditingController controller = TextEditingController();

  App_TextField({
    required this.controller,
    this.validator,
    this.keyboardType,
    this.focusColor,
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
       keyboardType: keyboardType,
       maxLines: maxline,
        style: TextStyle(color: Colors.black),
        controller: controller,
        decoration: InputDecoration(
          // disabledBorder: OutlineInputBorder(
          //     borderSide: BorderSide(color: Colors.green),
          //     borderRadius: BorderRadius.circular(10)),
          focusedBorder:OutlineInputBorder(
              borderSide: BorderSide(color: focusColor??AppColor.purple),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrange),
              borderRadius: BorderRadius.circular(10)),
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
