import 'package:emi_calculator/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ResultComponent extends StatelessWidget {
  HomeController homeValue = Get.put(HomeController());

  var noSimbolInUSFormat =
      new NumberFormat.currency(locale: "HI", symbol: "₹");

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Loan EMI',
                style: GoogleFonts.poppins(
                    fontSize: 32, fontWeight: FontWeight.bold)),
            GetX<HomeController>(
                init: HomeController(),
                builder: (_c) {
                  return Text(
                    "${noSimbolInUSFormat.format(homeValue.emi.round())} pm",
                    style:
                        GoogleFonts.poppins(fontSize: 30, color: Colors.grey),
                  );
                })
          ],
        ));
  }
}
