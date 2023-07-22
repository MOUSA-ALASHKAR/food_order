import 'package:flutter/material.dart';

import '../colors.dart';

class MenuTypeWidget extends StatelessWidget {
  const MenuTypeWidget({Key? key, required this.imageName, required this.title, required this.type}) : super(key: key);

  final String imageName;
  final String title;
  final String type;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Padding(
      padding:  EdgeInsetsDirectional.symmetric(vertical: size.width*0.005),
      child: Container(
        width: size.width,
        height: size.height*0.26,
        child: Stack(
          children: [
            Image.asset('images/$imageName.png' , width: size.width , height: size.height , fit: BoxFit.cover),
            Padding(
              padding: EdgeInsetsDirectional.only(top: size.width*0.35 , start: size.width*0.04),
              child: Text(title,
                style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: size.width*0.04),),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: size.width*0.42 , start: size.width*0.03),
              child: Row(
                children: [
                  Icon(Icons.star , color: AppColors.mainOrangeColor,),
                  Text(' 4.9 ' , style: TextStyle(color: AppColors.mainOrangeColor),),
                  Text(type , style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
