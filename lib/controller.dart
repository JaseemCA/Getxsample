import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';  

class ConterController extends GetxController {
  var count = 0.obs;
  void increment() {
    count++;
  }

  void decrement() {
    count--;
  }
}

class MyController extends GetxController {
  void printHello() {
    print('hello world');
  }
}

class ColorController extends GetxController {
  // Observable variable for scaffold color
  var scaffoldcolor = Colors.white.obs;
 var barcolor = Colors.white.obs;
  // Function to change the color
  void changeColor() {
    // Generate a random color
    scaffoldcolor.value = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
    void changebarColor() {
    // Generate a random color
    barcolor.value = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
}

