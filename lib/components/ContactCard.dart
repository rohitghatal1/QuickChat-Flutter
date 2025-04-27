import 'package:firt_flutter_app/Model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.contacts}) : super(key: key);
  final ChatModel contacts;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          child: SvgPicture.asset("assets/personIcon.svg", color: Colors.white),
          backgroundColor: Colors.blueGrey.shade200,
        ),
        title: Text(
          contacts.name,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          contacts.status ?? "",
          style: TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}
