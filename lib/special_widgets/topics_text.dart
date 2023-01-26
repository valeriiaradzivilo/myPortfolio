import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopicText extends StatelessWidget {
  final String text;
  final double fontSizeS;
  const TopicText({Key? key, required this.text, required this.fontSizeS}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        color: const Color(0xFF38338e),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSizeS,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w600,
          ),
          overflow: TextOverflow.clip,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
