import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mailto/mailto.dart';
import 'package:portfolio/special_widgets/topics_text.dart';
import 'package:sizer/sizer.dart';

import 'package:portfolio/special_widgets/main_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsZip extends StatelessWidget {
  final String type; //phone photo email
  final String textInfo;
  ContactsZip({Key? key, required this.type, required this.textInfo})
      : super(key: key);

  void makeCall() {
    launchUrl(Uri.parse("tel://$textInfo"));
  }

  void copyText(BuildContext context) {
    Clipboard.setData(ClipboardData(text: textInfo)).then(
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Text is copied to clipboard")));
      },
    );
  }

  double paddingAll = 2.h;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      type == "Photo"
          ? Padding(
              padding: EdgeInsets.all(paddingAll),
              child: Image(
                image: AssetImage(textInfo),
                width: 25.w,
              ))
          : TopicText(text: type, fontSizeS: 33),
      (type == "Phone" || type == "Email")
          ? Slidable(
              endActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: type == "Phone"
                        ? (context) => makeCall()
                        : (context) => _sendEmail(),
                    icon: type == "Phone" ? Icons.phone : Icons.mail,
                    backgroundColor: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  SlidableAction(
                    onPressed: (context) => copyText(context),
                    icon: Icons.copy,
                    backgroundColor: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ],
              ),
              child: JustText(),
            )
          : (type!="Photo")?JustText():Text(""),
    ]);
  }

  _sendEmail() async {
    final mailtoLink = Mailto(
      to: ['radzivilovaleriia@gmail.com'],
      subject: '',
      body: 'Hi, have a nice day )\n From me',
    );
    await launchUrl(Uri.parse('$mailtoLink'));
  }

  MainText JustText() {
    return MainText(
      text: textInfo,
      size: 25,
      levelBold: 0,
      paddingLevel: paddingAll,
    );
  }
}
