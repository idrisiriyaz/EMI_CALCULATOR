import 'package:emi_calculator/controller.dart';
import 'package:emi_calculator/widgets/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomeSlider1 extends StatefulWidget {
  @override
  _CustomeSliderState1 createState() => _CustomeSliderState1();
}

class _CustomeSliderState1 extends State<CustomeSlider1> {
  double _currentSliderValue = 0;
  HomeController c = Get.put(HomeController());
  TextEditingController myController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: TextField(
              onChanged: (text) {
                c.interestRate.value = double.parse(text);
                c.setEmiValue();
              },
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              controller: myController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  labelText: 'INTEREST',
                  labelStyle: GoogleFonts.varela(fontSize: 15))),
        ),
        GetX<HomeController>(
            init: HomeController(),
            builder: (_c) {
              return SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.yellow[700],
                  inactiveTrackColor: Colors.yellow[100],
                  trackHeight: 4.0,
                  thumbColor: CustomColor.yellowColor,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  overlayColor: Colors.yellowAccent.withAlpha(32),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                ),
                child: Slider(
                  divisions: 30,
                  label: _currentSliderValue.round().toString() + "%",
                  min: 0,
                  activeColor: Colors.yellow,
                  value: _c.interestRate.value,
                  max: 30,

                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                      _c.interestRate.value =
                          double.parse(value.toStringAsFixed(2));
                      myController.text = value.toStringAsFixed(2);
                      _c.setEmiValue();
                    });
                  },
                ),
              );
            })
      ]),
    );
  }
}
