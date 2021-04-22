import 'package:emi_calculator/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Learn extends StatefulWidget {
  @override
  _LearnState createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  @override
  Widget build(BuildContext context) {
    HomeController obj = Get.put(HomeController());

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GetX<HomeController>(builder: (c) {
            return Text("${c.counter}");
          }),
          FlatButton(
            onPressed: obj.increment,
            child: Text("Press Me"),
          )
        ],
      ),
    );
  }
}
