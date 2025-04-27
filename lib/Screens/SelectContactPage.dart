import 'package:flutter/material.dart';

class SelectContactPage extends StatefulWidget {
  const SelectContactPage({super.key});

  @override
  State<SelectContactPage> createState() => _SelectContactPageState();
}

class _SelectContactPageState extends State<SelectContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Contact",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text("25 contacts", style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
