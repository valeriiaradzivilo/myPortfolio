import 'package:flutter/cupertino.dart';
import 'package:portfolio/special_widgets/social_links_button.dart';
import 'package:portfolio/special_widgets/topics_text.dart';

class TopicNGrid extends StatelessWidget {
  final String text;
  final List gridlist;
  final int columnsAmount;

  const TopicNGrid({Key? key, required this.text, required this.gridlist, required this.columnsAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
          SliverToBoxAdapter(
            child:TopicText(text: text),
          ),
          SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columnsAmount,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 5,
                    childAspectRatio: 5,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return LinkButton(
                        text: gridlist.elementAt(index)[0],
                        urlText: gridlist.elementAt(index)[1]);
                  },
                    childCount: gridlist.length,))),
      ],

        );
  }
}
