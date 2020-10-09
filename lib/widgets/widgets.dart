
import 'package:flutter/material.dart';

Widget appBar(BuildContext context){

  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 22,),
      children: <TextSpan>[

        TextSpan(text: 'quiz_app', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue,)),
      ],
    ),
  );
}