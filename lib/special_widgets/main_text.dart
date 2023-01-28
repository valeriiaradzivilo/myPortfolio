import 'package:flutter/cupertino.dart';

class MainText extends StatelessWidget {
  final String text;

  final int levelBold;
  final double paddingLevel;
  const MainText({Key? key, required this.text,required this.levelBold, required this.paddingLevel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(paddingLevel),
      child: Text(
        text,
        style: TextStyle(
          color: CupertinoColors.black,
          fontSize: 23,
          fontFamily: 'Lato',
          fontWeight: levelBold == 1
              ? FontWeight.w700
              : levelBold == 2
              ? FontWeight.bold
              : FontWeight.normal,
        ),
        overflow: TextOverflow.clip,
        textAlign: TextAlign.center,
      ),
    );
  }
}
