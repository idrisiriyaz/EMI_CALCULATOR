import 'package:emi_calculator/controller.dart';
import 'package:emi_calculator/widgets/color.dart';
import 'package:emi_calculator/widgets/gredian_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CustomeSlider2 extends StatefulWidget {
  @override
  _CustomeSliderState2 createState() => _CustomeSliderState2();
}

class _CustomeSliderState2 extends State<CustomeSlider2> {

  TextEditingController myController = new TextEditingController();
  HomeController homeValue = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    LinearGradient gradient = LinearGradient(
        colors: <Color> [
          Color(0xff051937),
          Color(0xff002966),
          Color(0xff003a98),
          Color(0xff0048cb),
          Color(0xff0a55ff),
        ]
    );
    return Container(
      decoration: BoxDecoration(),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: TextField(
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              onChanged: (text) {
                homeValue.periodMonth.value = int.parse(text);
                homeValue.setEmiValue();
              },
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
                  labelText: 'PERIOD',
                  labelStyle: GoogleFonts.varela(fontSize: 15))),
        ),
        GetX<HomeController>(builder: (_c) {
          return SliderTheme(

            data: SliderTheme.of(context).copyWith(
              trackShape: GradientRectSliderTrackShape(gradient: gradient, darkenInactive: false),
              activeTrackColor: Colors.blue[700],
              inactiveTrackColor: Colors.blue[100],
              trackHeight: 17.0,
              thumbColor: Colors.blueAccent,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0,elevation: 2),
              overlayColor: Colors.blue.withAlpha(32),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
            ),
            child: Slider(
              divisions: 12,
              activeColor: CustomColor.blueColor,
              value: double.parse(_c.periodMonth.value.round().toString()),
              max: 12,
              onChanged: (double value) {
                setState(() {
                  _c.periodMonth.value = value.round();
                  myController.text = value.round().toString();
                  _c.setEmiValue();
                });
              },
            ),
          );
        }),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToggleSwitch(
                minWidth: 80.0,
                minHeight: 40.0,
                initialLabelIndex: 0,
                cornerRadius: 10.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.blue,
                inactiveFgColor: Colors.white,
                labels: ['Year', 'Month'],
                iconSize: 30.0,
                activeBgColors: [ homeValue.yearButton.value ? Color(0xff212121) : Colors.blue, Color(0xff212121)],
                onToggle: (index) {
                  if (index == 0) {
                    homeValue.selectButton("YEAR");
                  } else {
                    homeValue.selectButton("MONTH");
                  }
                },
              ),
            ),
          ],
        )
      ]),
    );
  }
}
