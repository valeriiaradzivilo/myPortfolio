import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/sections/contact_widget.dart';
import 'package:portfolio/special_widgets/main_text.dart';
import 'package:portfolio/special_widgets/social_links_button.dart';
import 'package:portfolio/special_widgets/topic_plus_grid.dart';
import 'package:portfolio/special_widgets/topics_text.dart';
import 'package:sizer/sizer.dart';

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
  List myContacts = [
    [
      "Photo",
      ["assets/images/my_photo.jpg"]
    ],
    [
      "About me",
      [
        "I have completed several personal projects and have strong communication skills. As a junior Android developer, I am eager to apply my skills and continue learning in this field. I am committed to constantly improving and expanding my abilities, and I am excited to contribute to the success of a team."
      ]
    ],
    [
      "City",
      ["Kyiv, Ukraine"]
    ],
    [
      "Phone",
      ["+380997103409"]
    ],
    [
      "Email",
      ["radzivilovaleriia@gmail.com"]
    ],
    [
      "Skills",
      [
        "Java",
        "Kotlin",
        "Android Studio",
        "REST API",
        "MYSQL",
        "Flutter",
        "Dart",
        "Git"
      ]
    ],
  ];

  List linkButtonsList = [
    [
      "LinkedIn profile",
      "https://www.linkedin.com/in/valeriia-radzivilo-0883ba248"
    ],
    ["Personal Github", "https://github.com/valeriiaradzivilo"],
    ["Study Github", "https://github.com/valeriia-radzivilo"],
  ];

  List projectButtonsList = [
    ["Calendar for online teachers",SimpleCalendar()],
    ["REST API work", ApiWorkPage()],
    ["Calculator", Calculator()],
    ["To Doer", ToDoAppPage()]
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
                        size: 1.w + 1.h,
                        levelBold: 2,
                        paddingLevel: 1.h,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child:TopicText(text: "GENERAL INFORMATION"),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 5,
                      childAspectRatio: 0.1.w,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return myContacts.elementAt(index)[1].length == 1
                            ? Column(
                                children: [
                                  Expanded(
                                    child: ContactsZip(
                                      type: myContacts.elementAt(index)[0],
                                      textInfo: myContacts.elementAt(index)[1]
                                          [0],
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  TopicText(
                                      text: myContacts.elementAt(index)[0]),
                                  for (int i = 0;
                                      i < myContacts.elementAt(index)[1].length;
                                      i++)
                                    Expanded(
                                      child: MainText(
                                          text: myContacts.elementAt(index)[1]
                                              [i],
                                          size: 23,
                                          levelBold: 0,
                                          paddingLevel: 1),
                                    ),
                                ],
                              );
                      },
                      childCount: myContacts.length,
                    ),
                  ),
                ),
                TopicNGrid(text: 'Find me', gridlist: linkButtonsList,
                columnsAmount: linkButtonsList.length,),
                SliverToBoxAdapter(
                  child:TopicText(text: "Projects"),
                ),
                SliverPadding(
                    padding: const EdgeInsets.all(8.0),
                    sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: linkButtonsList.length,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 5,
                          childAspectRatio: 5,
                        ),
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return LinkButton(
                              text: linkButtonsList.elementAt(index)[0],
                              urlText: linkButtonsList.elementAt(index)[1]);
                        },
                          childCount: linkButtonsList.length,))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
