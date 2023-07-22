import 'package:flutter/material.dart';
import 'package:food_order/core/translations/app_translations.dart';
import 'package:food_order/ui/shared/colors.dart';
import 'package:food_order/ui/shared/custom_widgets/menu_item_widget.dart';
import 'package:food_order/ui/shared/utils.dart';
import 'package:food_order/ui/views/desserts_view/desserts_view.dart';
import 'package:get/get.dart';


class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(
              children: [

                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: screenWidth(20) ,
                      start: screenWidth(20) ,
                      end: screenWidth(20) ,
                      bottom: screenWidth(20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(tr("menu_title") , style: TextStyle(color: AppColors.mainTextColor1 , fontSize: screenWidth(20)),),
                      InkWell(
                          child: Icon(Icons.shopping_cart , color: AppColors.mainTextColor1,),
                          onTap: (){},
                      ),
                    ],
                  ),
                ),

                Container(
                  alignment: Alignment.center,

                  margin: EdgeInsetsDirectional.symmetric( horizontal: screenWidth(30) , vertical: screenWidth(50)),
                  padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth(30) , vertical: screenWidth(50)),

                  height: screenWidth(8),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],

                  ),
                  child: TextField(
                    cursorColor:AppColors.mainTextColor1,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: AppColors.mainTextColor1,
                      ),
                      hintText: tr("menu_search"),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),

                SizedBox(height: screenWidth(10)),

                Row(
                  children: [
                    Stack(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: screenWidth(5),
                              height: screenHeight(1.6),
                              decoration: BoxDecoration(
                                color: AppColors.mainOrangeColor,
                                borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(50) , bottomEnd: Radius.circular(50)),
                              ),
                            ),

                            Column(
                              children: [
                                MenuItemWidget(imageName: 'food_image', foodName: tr("menu_food"), itemNumber: '120 Items', onPressed: (){}),
                                MenuItemWidget(imageName: 'beverages_image', foodName: tr("menu_beverages"), itemNumber: '220 Items', onPressed: (){}),

                                MenuItemWidget(
                                  imageName: 'desserts_image',
                                  foodName: tr("menu_desserts"),
                                  itemNumber: '155 Items',
                                  onPressed: (){
                                    Get.to(DessertsView());
                                  },
                                ),

                                MenuItemWidget(imageName: 'promotions_image', foodName: tr("menu_promotion"), itemNumber: '25 Items', onPressed: (){}),
                              ],
                            ),


                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: screenWidth(20)),

              ],
            ),
          ),

        ),
    );
  }
}
