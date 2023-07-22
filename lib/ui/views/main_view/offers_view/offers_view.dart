import 'package:flutter/material.dart';
import '../../../shared/colors.dart';
import '../../../shared/custom_widgets/offers_item.dart';



class OffersView extends StatefulWidget {
  const OffersView({Key? key}) : super(key: key);

  @override
  _OffersViewState createState() => _OffersViewState();
}

class _OffersViewState extends State<OffersView> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [

                Padding(
                  padding: EdgeInsetsDirectional.only(top: size.width*0.06 , start: size.width*0.05 , end: size.width*0.05 , bottom: size.width*0.06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Latest Offers' , style: TextStyle(color: AppColors.mainTextColor1 , fontSize: size.width*0.05),),
                      Icon(Icons.shopping_cart , color: AppColors.mainTextColor1,),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsetsDirectional.only(start: size.width*0.05 , bottom: size.width*0.05),
                  child: Row(
                    children: [
                      Text('Find discounts, Offers special meals and more!' ,
                        style: TextStyle(color: AppColors.mainTextColor2 , fontSize: size.width*0.035),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsetsDirectional.only(start: size.width*0.05 , bottom: size.width*0.03),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: (){},
                          child: Text('Check Offers' , style: TextStyle(fontSize: size.width*0.03),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mainOrangeColor,
                            shape: StadiumBorder(),
                            fixedSize: Size(size.width * 0.4, size.height * 0.02)),
                          ),
                    ],
                  ),
                ),

                Column(
                  children: [
                    OffersItem(imageName: 'offers_image_1', offerName: 'Café de Noires', rating: '4.9',),
                    OffersItem(imageName: 'offers_image_2', offerName: 'Isso', rating: '4.5',),
                    OffersItem(imageName: 'offers_image_3', offerName: 'Cafe Beans', rating: '4.6',),
                  ],
                ),

                SizedBox(height: size.height*0.07),

              ],
            ),
          ),
        )
    );
  }
}
