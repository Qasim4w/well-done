import 'package:flutter/material.dart';

class dropDown extends StatefulWidget {
  const dropDown({Key? key}) : super(key: key);

  @override
  State<dropDown> createState() => _dropDownState();
}

class _dropDownState extends State<dropDown> {

  var _selectedItem;
  List<String> items = [
    'Hour', 'Day', 'Month', 'Year'
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text('Week',style: TextStyle(fontSize: 17),),
       dropdownColor: Colors.grey,
      iconSize: 40,
      underline: Container(),
      style: TextStyle(color: Colors.black,),
      isExpanded: true,
      value: _selectedItem,
      onChanged: (newValue) {
        setState(() {
          _selectedItem = newValue;
        });
      },
      items: items
          .map<DropdownMenuItem<String>>(( value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value,style: TextStyle(fontSize: 17),),
        );
      })
          .toList(),
    );
  }
}
