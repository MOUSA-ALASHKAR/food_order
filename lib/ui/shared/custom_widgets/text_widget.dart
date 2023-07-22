import 'package:flutter/material.dart';
import 'package:food_order/ui/shared/colors.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key, required this.text, this.textSize, this.textColor, this.fontWeight, this.textAlign}) : super(key: key);

  final String text;
  final double? textSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Text(
      text,
      style: TextStyle(
        color: textColor ?? AppColors.mainTextColor1,
        fontSize: textSize ?? size.width*0.05,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      textAlign: textAlign
    );
  }
}
