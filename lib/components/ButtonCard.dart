import 'package:firt_flutter_app/Model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({Key? key, required this.name, this.icon}) : super(key: key);
  final String name;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        child: Icon(icon, size: 25, color: Colors.white,),
          backgroundColor: Colors.teal,
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
