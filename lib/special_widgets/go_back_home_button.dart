import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class goBackHome extends StatelessWidget {
  const goBackHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
        ),
        onPressed: () async {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
        },
        icon:const Icon(Icons.arrow_circle_left_outlined),
        label: const Text('Go back to portfolio'),
      ),
    );
  }
}
