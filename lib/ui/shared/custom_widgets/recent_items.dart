import 'package:flutter/material.dart';

import '../colors.dart';

class RecentItemWidget extends StatelessWidget {
  const RecentItemWidget({Key? key, required this.imageName, required this.name}) : super(key: key);

  final String imageName;
  final String name;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: size.width*0.02 , end: size.width*0.03 , bottom: size.width*0.02),
          child: Container(
            width: size.width*0.2,
            height: size.height*0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset('images/$imageName.png' , fit: BoxFit.cover),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name , style: TextStyle(fontSize: size.width*0.04 , fontWeight: FontWeight.bold),),
            SizedBox(height: size.width*0.01),
            Text('Café Western Food' , style: TextStyle(fontSize: size.width*0.03 , color: AppColors.mainTextColor2),),
            SizedBox(height: size.width*0.01),
            Row(
              children: [
                Icon(Icons.star , color: AppColors.mainOrangeColor , size: size.width*0.04),
                Text('4.9 ' , style: TextStyle(fontSize: size.width*0.03 , color: AppColors.mainOrangeColor),),
                Text('(124 Ratings)' , style: TextStyle(fontSize: size.width*0.03 , color: AppColors.mainTextColor2),),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
