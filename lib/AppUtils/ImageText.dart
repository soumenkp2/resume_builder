import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.img, required this.text})
      : super(key: key);
  final String img;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [imageItem(img), textItems(text)],
    );
  }
}

Widget textItems(String s) => Text(s,
    style: const TextStyle(
        fontWeight: FontWeight.bold, fontSize: 8.0, color: Colors.black));

Widget imageItem(String s) => Container(
    padding: const EdgeInsets.all(3.0),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    margin: const EdgeInsets.all(4),
    child: Image.asset(
      s,
      width: 40,
      height: 60,
      fit: BoxFit.cover,
    ));
