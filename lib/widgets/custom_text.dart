import 'package:flutter/material.dart';

Text textForTabBar(String text){
  return Text(text, style: const TextStyle(color: Colors.black, fontSize: 15),);
}

Text textForGetDataTitle(String text){
  return Text(text, style: const TextStyle(color: Colors.black, fontSize: 20), maxLines: 1,);
}

Text textForGetDataSubtitle(String text){
  return Text(text, style: const TextStyle(color: Colors.black, fontSize: 15), maxLines: 1,);
}

Text textForGetDataDetails(String text){
  return Text(text, style: const TextStyle(color: Colors.black, fontSize: 11), maxLines: 1,);
}