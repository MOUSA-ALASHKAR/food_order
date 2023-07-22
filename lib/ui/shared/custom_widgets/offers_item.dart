import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../colors.dart';

class OffersItem extends StatelessWidget {
  const OffersItem({Key? key, required this.imageName, required this.offerName, required this.rating, this.number_of_rating, this.foodType}) : super(key: key);

  final String imageName;
  final String offerName;
  final String rating;
  final String? number_of_rating;
  final String? foodType;


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height*0.35,
      child: Column(
        children: [
          Image.asset('images/$imageName.png' , fit: BoxFit.cover , width: size.width,),
          SizedBox(height: size.height*0.01),
          Padding(
            padding:  EdgeInsetsDirectional.only(start: size.width*0.03 , bottom: size.width*0.01),
            child: Row(
              children: [
                Text(offerName , style: TextStyle(color: AppColors.mainTextColor1 , fontSize: size.width*0.04),),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: size.width*0.03),
            child: Row(
              children: [
                SvgPicture.asset('images/star_icon.svg'),
                Text(' '+rating+' ' , style: TextStyle(color: AppColors.mainTextColor2),),
                Text(number_of_rating ?? '(124 ratings) ' , style: TextStyle(color: AppColors.mainTextColor2)),
                SizedBox(width: size.width*0.03),
                Text(foodType ?? 'Cafe Western Food' , style: TextStyle(color: AppColors.mainTextColor2)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
