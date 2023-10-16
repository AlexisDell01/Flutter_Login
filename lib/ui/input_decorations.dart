import 'package:flutter/material.dart';

class InputDecorations{

  static InputDecoration authInputDecoration({

  required String hintText,
  required String labelText,
  IconData? prefixIcon


  }){
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFC800B7)
        )


      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
        color:Color(0xFFFF8902),
        width: 1
        ),
      ),
      hintText: hintText,
      labelText: labelText,
      labelStyle: const TextStyle(
        color:Colors.grey,
        fontSize: 14
      ),
      prefixIcon: prefixIcon != null
      ?Icon(prefixIcon,color: const Color(0xFFE900E9),)
      :null
    );
  }

}