import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class InterestCard2 extends StatelessWidget {
  const InterestCard2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var format = NumberFormat.currency(locale: 'HI');
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "Total Interest",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(1)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Text(
                "Rs. 0.00",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    color: Colors.blue[700]),
              ),
            ),
          ],
        ),
        padding: EdgeInsets.only(bottom: 10),
        margin: EdgeInsets.only(right: 20, bottom: 20, left: 5),
        height: 90,
        width: 90,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(1, 2), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue[200], Colors.blue[400]])),
      ),
    );
  }
}
