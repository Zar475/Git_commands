import 'package:flutter/cupertino.dart';

class Calculator extends ChangeNotifier {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  get output1 =>  _output;
   set output1(String output1) => _output = output1;

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      output1 = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(output1);

      operand = buttonText;

      output1 = "";
    } else if (buttonText == ".") {
      if (output1.contains(".")) {
        print("Already conatains a decimals");
        return;
      } else {
        output1 = output1 + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output1);

      if (operand == "+") {
        output1 = (num1 + num2).toString();
      }
      if (operand == "-") {
        output1 = (num1 - num2).toString();
      }
      if (operand == "X") {
        output1 = (num1 * num2).toString();
      }
      if (operand == "/") {
        output1 = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      output1 = output1 + buttonText;
    }
    notifyListeners();
  }
   
}
