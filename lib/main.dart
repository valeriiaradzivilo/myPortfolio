import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/my_projects/api_project/views/home_page_api.dart';
import 'package:portfolio/my_projects/calculator.dart';
import 'package:portfolio/my_projects/calendar.dart';
import 'package:portfolio/extra_skills/abstract_factory.dart';
import 'package:portfolio/my_projects/to_do_app/main_to_do.dart';
import 'package:portfolio/sections/contacts_section.dart';
import 'package:portfolio/sections/contact_widget.dart';
import 'package:portfolio/special_widgets/main_text.dart';
import 'package:portfolio/special_widgets/project_buttons.dart';
import 'package:portfolio/special_widgets/social_links_button.dart';
import 'package:portfolio/special_widgets/topic_plus_main_text.dart';
import 'package:portfolio/special_widgets/topics_text.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:mailto/mailto.dart';

import 'extra_skills/builder_design_pattern/main_builder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Valeriia Radzivilo Portfolio',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
    });
  }
}

class HomePage extends StatelessWidget {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  List<String> mySkills = [
    "Java",
    "Kotlin",
    "Android Studio",
    "REST API",
    "SQL",
    "Flutter",
    "Dart",
    "Git"
  ];

  List myContacts = [
    ["Photo", "assets/images/my_photo.jpg"],
    ["City", "Kyiv, Ukraine"],
    ["Phone", "+380997103409"],
    ["Email", "radzivilovaleriia@gmail.com"],
    //["About me", "I have completed several personal projects and have strong communication skills. As a junior Android developer, I am eager to apply my skills and continue learning in this field. I am committed to constantly improving and expanding my abilities, and I am excited to contribute to the success of a team."],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 147, 149, 211),
      appBar: AppBar(
        centerTitle: true,
        title: MainText(
          text: "Valeriia Radzivilo",
          size: 3.w + 3.h,
          levelBold: 2,
          paddingLevel: 2.h,
        ),
        backgroundColor: const Color(0xFFEEE16D),
        elevation: 0,
      ),
      body: GridView.count(
        shrinkWrap: true,
        // childAspectRatio: 1 / 2,
        crossAxisCount: 2,
        children: [
          ContactsSection(myContacts: myContacts),
          const TopicNMain(
              topic: "About me",
              main_text:
                  "I have completed several personal projects and have strong communication skills. As a junior Android developer, I am eager to apply my skills and continue learning in this field. I am committed to constantly improving and expanding my abilities, and I am excited to contribute to the success of a team.",
              topic_size: 33),
          TopicText(text: "Skills", fontSizeS: 33),
          GridView.count(crossAxisCount: 2,
          children: [
            for(int i =0; i<mySkills.length;i++)
              MainText(text: mySkills.elementAt(i),
                  size: 14,
                  levelBold: 0,
                  paddingLevel: 0)
          ],)
        ],
      ),
    );
  }
}
