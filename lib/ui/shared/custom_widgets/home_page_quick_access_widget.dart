import 'package:flutter/material.dart';

class QuickAccessWidget extends StatelessWidget {
  const QuickAccessWidget({Key? key, required this.imageName, required this.text}) : super(key: key);

  final String imageName;
  final String text;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: size.width*0.02 , vertical: size.width*0.02),
      child: Container(
        width: size.width*0.25,
        height: size.height*0.14,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Image.asset('images/$imageName.png'),
            SizedBox(height: size.width*0.01),
            Text(text)
          ],
        ),
      ),
    );
  }
}
