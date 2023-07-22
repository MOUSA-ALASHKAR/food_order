import 'package:flutter/material.dart';

import '../colors.dart';

class SettingFieldItem extends StatelessWidget {
  const SettingFieldItem({Key? key, required this.name, required this.imageName, this.colorBadge}) : super(key: key);

  final String name;
  final String imageName;
  final Color? colorBadge;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [

        Padding(
          padding: EdgeInsetsDirectional.only(
              top: size.width * 0.02,
              bottom: size.width * 0.02,
              start: size.width * 0.0),
          child: Container(
            width: size.width * 0.85,
            height: size.height * 0.12,
            decoration: BoxDecoration(
              color: Color.fromRGBO(239, 239, 239, 1.0),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsetsDirectional.only(start: size.width * 0.00),
          child: Container(
            padding: EdgeInsetsDirectional.all(size.width*0.01),
            margin: EdgeInsetsDirectional.only(start: size.width * 0.03),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: colorBadge!= null ? Color.fromRGBO(216, 216, 216, 1) : Color.fromRGBO(216, 216, 216, 1),
            ),
            child: Image.asset(
              'images/$imageName.png',
              width: 50,
              height: 50,
            ),
          ),
        ),

        Padding(
          padding: EdgeInsetsDirectional.only(start: size.width * 0.25),
          child: Text(name , style: TextStyle(fontSize: size.width * 0.04,color: AppColors.mainTextColor1)),
        ),

        Padding(
          padding: EdgeInsetsDirectional.only(start: size.width * 0.7),
          child: Container(
            padding: EdgeInsetsDirectional.all(size.width*0.008),
            decoration: BoxDecoration(
              color: colorBadge ?? Colors.transparent,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text('15' , style: TextStyle(color: Color.fromRGBO(239, 239, 239, 1.0),),),
          ),
        ),

        Padding(
          padding: EdgeInsetsDirectional.only(start: size.width * 0.825),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color.fromRGBO(239, 239, 239, 1.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.all(size.width * 0.008),
              child: Icon(Icons.arrow_forward_ios,
                  color: AppColors.mainTextColor2),
            ),
          ),
        ),

      ],
    );
  }
}
