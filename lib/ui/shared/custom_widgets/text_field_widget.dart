import 'package:flutter/material.dart';
import 'package:food_order/ui/shared/colors.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({Key? key, required this.hitText, this.borderColor, this.textColor, this.backColor, this.labelText, required this.controller, this.keyboardType, this.validator}) : super(key: key);

  final String hitText;
  final Color? borderColor;
  final Color? textColor;
  final Color? backColor;
  final String? labelText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(vertical: 1 ,horizontal: 18),
      child: TextFormField(
        validator: widget.validator,
        // textInputAction: TextInputAction.next,
        // autofocus: true,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        decoration: InputDecoration(
          errorStyle: TextStyle(color: AppColors.mainOrangeColor),
          filled: true,
          fillColor: widget.backColor ?? AppColors.textFieldColor,
          hintText: widget.hitText,
          contentPadding: EdgeInsetsDirectional.symmetric(vertical: 25 ,horizontal: 30),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(color: widget.borderColor ?? AppColors.transparentColor)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(color: widget.borderColor ?? AppColors.transparentColor),
          ),

        ),
        style: TextStyle(color: widget.textColor ?? Colors.black45),
      ),
    );
  }
}
