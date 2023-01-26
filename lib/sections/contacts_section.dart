import 'package:flutter/cupertino.dart';

import 'contact_widget.dart';

class ContactsSection extends StatelessWidget {
  final List myContacts;
  const ContactsSection({Key? key, required this.myContacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: myContacts.length,
      itemBuilder: (BuildContext context, int index) {
        return Expanded(
          child: ContactsZip(
            type: myContacts.elementAt(index)[0],
            textInfo: myContacts.elementAt(index)[1],
          ),
        );
      },
    );
  }
}
