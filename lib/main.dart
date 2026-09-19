import 'package:flutter/material.dart';

void main() {
  void FindSum(List<int> numbers){
    int sum = 0;
    for (int i = 0; i < numbers.length; i++){
      sum = sum + numbers[i];
    }
    print("Sum of the list is $sum");


  }
  List<int> numberss = [1,2,3,4,5,6,7,8,9];
  FindSum(numberss);

}


