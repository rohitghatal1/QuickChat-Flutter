import 'package:firt_flutter_app/Model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.contacts}) : super(key: key);
  final ChatModel contacts;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 25,
              child:
                  SvgPicture.asset("assets/personIcon.svg", color: Colors.white),
              backgroundColor: Colors.blueGrey.shade200,
            ),
            (contacts.selected ?? false) ? Positioned(
              bottom: 4,
              right: 5,
              child: CircleAvatar(
                  backgroundColor: Colors.teal,
                  radius: 11,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 18,
                  )),
            ) : Container()
          ],
        ),
      ),
      title: Text(
        contacts.name,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        contacts.status ?? "",
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}
