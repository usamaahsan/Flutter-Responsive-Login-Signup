import 'package:flutter/material.dart';
import 'package:materialloginsignup/styles/colors.dart';
import 'package:materialloginsignup/styles/textStyles.dart';

Widget TextFieldWithIcon({
  required TextEditingController controller,
  Icon? icon,
  Widget? suffix,
  required String hint,
  TextInputType inputType = TextInputType.text,
  required Function validator,
  bool obscureText = false
}){
  return  TextFormField(
      keyboardType: inputType,
      controller: controller,
      style: bodyFontStyle,
      textAlignVertical: TextAlignVertical.center,      
      obscureText: obscureText,
      decoration: InputDecoration(     
          prefixIcon: icon,   
          suffixIcon: suffix,
          hintText: hint,
          hintStyle: bodyFontStyle,
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(
              color: primaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          contentPadding: const EdgeInsets.all(10),
          errorStyle: body2FontStyle.copyWith(fontSize: 10, color: Colors.red)),
          validator: (value)=> validator(value),
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return 'enter_valid_amount';
          //   }
  
          //   return null;
          // },
    );
}