import 'package:flutter/cupertino.dart';
import 'package:portfolio/special_widgets/main_text.dart';
import 'package:portfolio/special_widgets/topics_text.dart';

class TopicNMain extends StatelessWidget {
  final String topic;
  final String main_text;
  final double topic_size;
  const TopicNMain({Key? key, required this.topic, required this.main_text, required this.topic_size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopicText(text: topic, fontSizeS: topic_size),
        MainText(text: main_text, size: topic_size-10, levelBold: 0, paddingLevel: 2)
      ],
    );
  }
}
