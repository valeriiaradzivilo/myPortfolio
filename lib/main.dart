import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/sections/contact_widget.dart';
import 'package:portfolio/special_widgets/main_text.dart';
import 'package:portfolio/special_widgets/social_links_button.dart';
import 'package:portfolio/special_widgets/topic_plus_grid.dart';
import 'package:portfolio/special_widgets/topics_text.dart';
import 'package:sizer/sizer.dart';

import 'extra_skills/abstract_factory.dart';
import 'extra_skills/builder_design_pattern/main_builder.dart';
import 'my_projects/api_project/views/home_page_api.dart';
import 'my_projects/calculator.dart';
import 'my_projects/calendar.dart';
import 'my_projects/to_do_app/main_to_do.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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

  List bigInfo = [
    [
      "Photo",
      "assets/images/my_photo.jpg", "big"
    ],
    [
      "About me",

      "I have completed several personal projects and have strong communication skills. As a junior Android developer, I am eager to apply my skills and continue learning in this field. I am committed to constantly improving and expanding my abilities, and I am excited to contribute to the success of a team."
      , "big"
    ],
  ];
  List myContacts = [

    [
      "City",
      "Kyiv, Ukraine", "contact"
    ],
    [
      "Phone",
      "+380997103409", "contact"
    ],
    [
      "Email",
      "radzivilovaleriia@gmail.com", "contact"
    ],

  ];

  List mySkills =
  [
    ["Skills", "Java", "text"],
    ["Skills", "Kotlin", "text"],
    ["Skills", "Android Studio", "text"],
    ["Skills", "REST API", "text"],
    ["Skills", "MYSQL", "text"],
    ["Skills", "Flutter", "text"],
    ["Skills", "Git", "text"],
    ["Skills", "Dart", "text"],

  ];

  List linkButtonsList = [
    [
      "LinkedIn profile",
      "https://www.linkedin.com/in/valeriia-radzivilo-0883ba248",
      "link"
    ],
    ["Personal Github", "https://github.com/valeriiaradzivilo",
      "link"],
    ["Study Github", "https://github.com/valeriia-radzivilo",
      "link"],
  ];

  List projectButtonsList = [
    ["Calendar for online teachers", SimpleCalendar(),"project"],
    ["REST API work", ApiWorkPage(),"project"],
    ["Calculator", Calculator(),"project"],
    ["To Doer", ToDoAppPage(),"project"],
    ["Design Pattern: Abstract Factory",AbstractFactory(),"project"],
    ["Design Pattern: Builder",BuilderAppHomePage(),"project"]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 147, 149, 211),
      appBar: AppBar(
        centerTitle: true,
        title: MainText(
          text: "Valeriia Radzivilo",
          levelBold: 2,
          paddingLevel: 2.h,
        ),
        backgroundColor: const Color(0xFFEEE16D),
        elevation: 0,
      ),
      body: Row(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: const Color(0xFFEEE16D),
                  stretch: true,
                  expandedHeight: 10.h,
                  flexibleSpace: FlexibleSpaceBar(
                    stretchModes: <StretchMode>[
                      StretchMode.zoomBackground,
                      StretchMode.blurBackground,
                      StretchMode.fadeTitle,
                    ],
                    centerTitle: true,
                    title: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: MainText(
                        text: "Android / Flutter developer",
                        levelBold: 2,
                        paddingLevel: 1.h,
                      ),
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: TopicText(text: "GENERAL INFORMATION"),
                ),
                TopicNGrid(
                  gridlist: bigInfo,
                  columnsAmount: 2,
                ),
                TopicNGrid(
                  gridlist: myContacts,
                  columnsAmount: 1,
                ),
                SliverToBoxAdapter(child: TopicText(text: "Find me")),
                TopicNGrid(
                  gridlist: linkButtonsList,
                  columnsAmount: linkButtonsList.length,
                ),
                SliverToBoxAdapter(
                  child: TopicText(text: "Projects"),
                ),
                TopicNGrid(
                  gridlist: projectButtonsList,
                  columnsAmount: (projectButtonsList.length/3).toInt(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
