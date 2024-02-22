import 'package:flutter/material.dart';
import '../utils/color_code.dart';

AppBar customAppbar(){
  return AppBar(
    backgroundColor: ColorsCode.primaryColor,
    title: const Text("ScubeTech", style: TextStyle(color: ColorsCode.whiteColor, fontSize: 20),),
    centerTitle: true,
  );
}