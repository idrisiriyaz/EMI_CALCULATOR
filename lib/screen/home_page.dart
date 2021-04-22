import 'package:emi_calculator/controller.dart';
import 'package:emi_calculator/widgets/animated_button.dart';
import 'package:emi_calculator/widgets/slider_2.dart';
import 'package:emi_calculator/widgets/result_widget.dart';
import 'package:emi_calculator/widgets/slider_1.dart';
import 'package:emi_calculator/widgets/slider_3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_widgets/interest_card.dart';
import 'home_widgets/total_amount_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController home = Get.put(HomeController());

  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: RxSwitchButton(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ResultComponent(),
                Flexible(
                    child: Container(
                  height: 100,
                  width: 110,
                ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [InterestCard(), InterestCard2()],
            ),
            Card(
                elevation: 2,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: CustomeSlider()),
            SizedBox(
              height: 20,
            ),
            Card(
                elevation: 2,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: CustomeSlider1()),
            Card(
                elevation: 2,
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: CustomeSlider2()),
          ],
        ),
      )),
    );
  }
}
