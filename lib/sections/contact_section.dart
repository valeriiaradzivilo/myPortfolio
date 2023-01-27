import 'package:flutter/cupertino.dart';

import 'contact_widget.dart';

class ContactsSection extends StatelessWidget {
  final List myContacts;
  const ContactsSection({Key? key, required this.myContacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: const EdgeInsets.all(8.0),
        sliver:
            SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          return Expanded(
            child: ContactsZip(
              type: myContacts.elementAt(index)[0],
              textInfo: myContacts.elementAt(index)[1][0],
            ),
          );
        })));
  }
}
