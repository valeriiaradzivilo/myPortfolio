import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

class LinkButton extends StatelessWidget {
  final String text;
  final String urlText;
  const LinkButton({Key? key, required this.text, required this.urlText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 33.w,
      height: 7.h,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFEEE16D),
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 0,
                ),
                // border radius
                borderRadius: BorderRadius.circular(16)),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 3.w,
            ),
            textAlign: TextAlign.center,
          ),
          onPressed: () async {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Opening profile")));
            if (kIsWeb) {
              html.window.open(urlText, '_blank');
            } else {
              await launchUrl(Uri.parse(urlText));
            }
          },
        ),
      ),
    );
  }
}
