import 'package:emi_calculator/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomeSlider extends StatefulWidget {
  @override
  _CustomeSliderState createState() => _CustomeSliderState();
}

class _CustomeSliderState extends State<CustomeSlider> {
  double _currentSliderValue = 0;
  HomeController homeValue = Get.put(HomeController());
  TextEditingController myController = new TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: TextField(
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              onChanged: (text) {
                homeValue.loanAmount.value =
                    text.isEmpty != true ? double.parse(text) : 0.0;
                validateMax(text);
                homeValue.setEmiValue();
              },
              controller: myController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  // errorText: validateMax(myController.text),
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.red),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  labelText: 'LOAN AMOUNT',
                  labelStyle: GoogleFonts.varela(fontSize: 15))),
        ),
        GetX<HomeController>(
            init: HomeController(),
            builder: (_c) {
              return SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.red[700],
                  inactiveTrackColor: Colors.red[100],
                  activeTickMarkColor: Colors.black,
                  trackHeight: 4.0,
                  thumbColor: Colors.redAccent,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  overlayColor: Colors.red.withAlpha(32),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                ),
                child: Slider(
                  activeColor: Colors.red,
                  value: _c.loanAmount.value,
                  min: 0,
                  max: 999999,
                  label: _currentSliderValue.roundToDouble().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                      _c.loanAmount.value =
                          double.parse(_currentSliderValue.toStringAsFixed(2));
                      myController.text = _c.loanAmount.value >= 0
                          ? _c.loanAmount.value.toStringAsFixed(2)
                          : 0;
                      _c.setEmiValue();
                    });

                    print("Slider value ${homeValue.loanAmount}");
                  },
                ),
              );
            })
      ]),
    );
  }

  String validateMax(text) {
    if (int.parse(text) <= 99999) {
      return 'Must be less than 99999';
    } else {
      return null;
    }
  }
}
