
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Model/ChatModel.dart';
import '../Screens/IndividualPage.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, this.chatModel, this.sourchat}) : super(key: key);

  final ChatModel? chatModel;
  final ChatModel? sourchat;

  @override
  Widget build(BuildContext context) {
    // Handling null checks at the top for cleaner code
    final bool isGroup = chatModel?.isGroup ?? false;
    final String name = chatModel?.name ?? 'Unknown';
    final String currentMessage = chatModel?.currentMessage ?? 'No messages yet';
    final String time = chatModel?.time ?? '';

    return InkWell(
      onTap: () {
        if (chatModel != null && sourchat != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => IndividualPage(
                chatModel: chatModel!,
                sourchat: sourchat!,
              ),
            ),
          );
        }
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: SvgPicture.asset(
                isGroup ? "assets/groups.svg" : "assets/person.svg",
                color: Colors.white,
                height: 36,
                width: 36,
              ),
              backgroundColor: Colors.blueGrey,
            ),
            title: Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all),
                const SizedBox(width: 3),
                Text(
                  currentMessage,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            trailing: Text(time),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
