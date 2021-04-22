import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:finance/finance.dart';

class HomeController extends GetxController {
  RxInt counter = 0.obs;

  void increment() {
    counter.value++;
    if (counter > 10) {
      counter--;
    }
  }

  RxDouble loanAmount = 0.0.obs;
  RxDouble interestRate = 0.0.obs;
  RxInt periodMonth = 0.obs;
  RxDouble emi = 0.0.obs;
  RxDouble _temp = 0.0.obs;
  RxBool yearButton = true.obs;
  RxBool monthButton = false.obs;
  RxBool isDarkModeEnabled = false.obs;
  RxInt totalAmount = 0.obs;
  RxDouble totalInterest = 0.0.obs;

  selectButton(String button) {
    if (button == "YEAR") {
      yearButton.value = true;
      monthButton.value = false;
      setEmiValue();
    } else if (button == "MONTH") {
      monthButton.value = true;
      yearButton.value = false;
      setEmiValue();
    }
  }

  double a, b, c;

  @override
  void onInit() {
    super.onInit();
    setEmiValue();
    calculateTotallAmount();
  }

  void setDarkMode() {
    //Dark mode switch

    if (isDarkModeEnabled.value == true) {
      isDarkModeEnabled.value = false;
      Get.changeTheme(ThemeData.light());
    } else {
      isDarkModeEnabled.value = true;
      Get.changeTheme(ThemeData.dark());
    }
  }

  calculateTotallAmount() {
    if (yearButton.value) {
      var totalMonth = periodMonth.value.round() * 12;
      totalAmount.value = 12 * emi.value.round();
    }
  }

  totalAmountWithInterest(){


    if (yearButton.value){

      var total =loanAmount.value*interestRate.value;
      print (total);
    }
  }

  void setEmiValue() {
    double i = double.parse(interestRate.value.toStringAsFixed(3)) / 100;
    int t = periodMonth.value.round();
    double am = loanAmount.value.roundToDouble();

    print("time : $t interest: $i amount: $am");

    //Value in terms of year
    if (i != 0 && t != 0 && am != 0) {
      //Formula part by terms of year
      if (yearButton.value) {
        _temp.value = Finance.pmt(
          rate: i / 12,
          nper: t * 12,
          pv: am,
        );
      }
      //Value in terms of month
      else {
        _temp.value = Finance.pmt(
          rate: i / t,
          nper: t,
          pv: am,
        );
      }
    }

    //Answer part
    calculateTotallAmount();
    emi.value = double.parse(_temp.value.abs().toStringAsFixed(2));
    print("Emi value :${emi.value.roundToDouble()}");
  }
}
