import 'package:flutter/material.dart';
import '../utils/color_code.dart';


TextFormField textFormField(TextEditingController projectName, String textHint, String textLabel, String errorText){
  return TextFormField(
    controller: projectName,
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsCode.primaryColor),
          borderRadius:
          BorderRadius.all(Radius.circular(12))),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsCode.primaryColor),
          borderRadius:
          BorderRadius.all(Radius.circular(12))),
      hintText: textHint,
      labelText: textLabel,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return errorText;
      }
      return null;
    },
  );
}