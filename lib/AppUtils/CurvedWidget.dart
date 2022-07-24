import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/AppUtils/TextWidget.dart';


class CurvedWidget extends StatelessWidget {
  CurvedWidget(
      {Key? key, required this.s, required this.size, required this.color})
      : super(key: key);
  final String s;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(18),
        ),
        color: Color(0xFF78CBEC),
      ),
      child: Stack(
        children: [
          Positioned(
              top: 70,
              left: 0,
              child: Container(
                height: 80,
                width: 300,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              )),
          Positioned(
              top: 100,
              left: 20,
            child: Text(s, style: GoogleFonts.poppins(textStyle: TextStyle(),fontWeight: FontWeight.bold, fontSize: size)),
          ),
      ]
      ),
    );
  }
}
