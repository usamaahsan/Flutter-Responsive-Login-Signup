import 'package:flutter/material.dart';
import 'package:materialloginsignup/styles/constants.dart';
import 'package:materialloginsignup/styles/textStyles.dart';


Widget primaryBtn({
  required String text,
  required Function onTap,
  IconData? icon,
  MainAxisAlignment mainAlignment = MainAxisAlignment.center,
  Color backgroundColor = Colors.white,
  Color foregroundColor = Colors.black}){

  return Material(
    color: backgroundColor,
    borderRadius: BorderRadius.circular(6),
    child: InkWell(
      borderRadius: BorderRadius.circular(6),
      onTap: (){
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(margin),
        child: Row(
          mainAxisAlignment: mainAlignment,
          children: [
            if(icon != null)
            Icon(icon, color: foregroundColor,),
            Text(text, style: bodyFontStyle.copyWith(color: foregroundColor),),
          ],
        )
      ),
    ),
  );

}
