import 'package:flutter/material.dart';

import '../colors.dart';

class CustomDropdownButton extends StatefulWidget {

  final String dropdownValue;
  final String labelTeaxt;



  CustomDropdownButton({ required this.dropdownValue, required this.labelTeaxt});

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}
const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class _CustomDropdownButtonState extends State<CustomDropdownButton> {


  @override
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {

    final size=MediaQuery.of(context).size;

    return  Container(
      color: AppColors.textFieldColor,
      height: size.height*0.08,
      width: size.width,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
            labelText: 'Popularity',
            labelStyle: TextStyle(color: Colors.black,fontSize: 30)
        ),
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down_outlined),
        style: const TextStyle(color: Colors.grey,fontSize: 20),

        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value as String;
          });
        },
        items: list.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );

  }
}

