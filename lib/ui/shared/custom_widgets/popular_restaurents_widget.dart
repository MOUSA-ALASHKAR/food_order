import 'package:flutter/material.dart';

import '../colors.dart';

class PopularRestaurantWidget extends StatelessWidget {
  const PopularRestaurantWidget({Key? key, required this.imageName, required this.name}) : super(key: key);

  final String imageName;
  final String name;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsetsDirectional.only(top: size.width*0.01 , bottom: size.width*0.01),
      child: Container(
        width: size.width,
        height: size.height*0.33,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/$imageName.png' , fit: BoxFit.cover , width: size.width,),
            SizedBox(height: size.width*0.01),
            Text('    '+name , style: TextStyle(fontSize: size.width*0.04),),
            Row(
              children: [
                SizedBox(width: size.width*0.02),
                Icon(Icons.star , color: AppColors.mainOrangeColor,),
                Text('4.9 ' , style: TextStyle(color: AppColors.mainOrangeColor),),
                Text('(124 ratings) Café Western Food'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
