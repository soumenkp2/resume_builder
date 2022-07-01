import 'package:flutter/material.dart';
import 'package:resume_builder/AppUtils/TextWidget.dart';


class BoxImage extends StatelessWidget {
  BoxImage({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160,
          width: 145,
          child: Stack(
            children: [
              Positioned(
                top: 20,
                left: 20,
                child: Material(
                  child: Container(
                    height: 120,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('Images/img.jpg'),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: const Offset(-10.0, 10.0),
                            blurRadius: 20.0,
                            spreadRadius: 4.0),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        TextWidget(text: text, size: 12, color: Color(0xFF000000))
      ],
    );
  }
}
