import 'package:flutter/material.dart';

import '../colors.dart';

class MostPopularWidget extends StatelessWidget {
  const MostPopularWidget({Key? key, required this.imageName, required this.name}) : super(key: key);

  final String imageName;
  final String name;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: size.width*0.02 , vertical: size.width*0.02),
      child: Container(
        width: size.width*0.6,
        height: size.height*0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/$imageName.png' , width: size.width , fit: BoxFit.cover),
            Text(name),
            Row(
              children: [
                Text('Café Western Food   '),
                Icon(Icons.star , color: AppColors.mainOrangeColor,),
                Text(' 4.9' , style: TextStyle(color: AppColors.mainOrangeColor),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
