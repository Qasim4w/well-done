import 'package:flutter/material.dart';
class dropDown<T> extends StatelessWidget {

  final List<T> items;
  String hintText;
  Widget? prefixIcon;

  Widget? widget;
  final void Function(T?) onChanged;
  dropDown({Key? key,


    required this.items,
    required this.hintText,
    this.prefixIcon,
    required this.onChanged,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DropdownButtonFormField<T>(
        decoration: InputDecoration(contentPadding: EdgeInsets.all(10),
            border: InputBorder.none,


            prefixIcon: prefixIcon,hintText: hintText),
        items: items.map((T item) {
          return DropdownMenuItem<T>(

            enabled: true,
            value: item,
            child: Text(
                item.toString(),style: TextStyle(color: Colors.black),),
          );
        }).toList(),
        onChanged: onChanged
    );
  }
}
