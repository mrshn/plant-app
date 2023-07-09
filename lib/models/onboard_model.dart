import 'package:flutter/material.dart';

class OnboardModel {
  String img;
  String text;
  String? text2;
  Color bg;
  Color button;

  OnboardModel({
    required this.img,
    required this.text,
    this.text2,
    required this.bg,
    required this.button,
  });
}
