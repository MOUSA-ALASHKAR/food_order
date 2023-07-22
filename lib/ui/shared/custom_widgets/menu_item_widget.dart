import 'package:flutter/material.dart';

import '../colors.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({Key? key, required this.foodName, required this.itemNumber, required this.imageName, required this.onPressed}) : super(key: key);

  final String imageName;
  final String foodName;
  final String itemNumber;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: (){onPressed();},
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(top: size.width*0.03 , bottom: size.width*0.03 ,start: size.width*0.1),
            child: Container(
              margin: EdgeInsetsDirectional.only(top: size.width*0.01),
              width: size.width*0.82,
              height: size.height*0.12,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(75),
                    bottomStart: Radius.circular(75),
                    topEnd: Radius.circular(15),
                    bottomEnd: Radius.circular(15)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(1, 2), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsetsDirectional.only(start: size.width*0.00),
            child: Image.asset('images/$imageName.png',width: 100,height: 100,),
          ),

          Padding(
            padding: EdgeInsetsDirectional.only(start: size.width*0.28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(foodName , style: TextStyle(fontSize: size.width*0.06 , fontWeight: FontWeight.bold),),
                SizedBox(height: size.height*0.01),
                Text(itemNumber , style: TextStyle(color: AppColors.mainTextColor2),),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsetsDirectional.only(start: size.width*0.87),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(1, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.all(size.width*0.01),
                child: Icon(Icons.arrow_forward_ios , color: AppColors.mainOrangeColor),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
