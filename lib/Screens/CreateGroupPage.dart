import 'package:firt_flutter_app/Model/ChatModel.dart';
import 'package:firt_flutter_app/components/AvatarCard.dart';
import 'package:firt_flutter_app/components/ButtonCard.dart';
import 'package:firt_flutter_app/components/ContactCard.dart';
import 'package:flutter/material.dart';

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({super.key});

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  List<ChatModel> contacts = [
    ChatModel(name: "Rohit Ghatal", status: "Frontend Developer"),
    ChatModel(name: "Birendra Dhamii", status: "Backend Developer"),
    ChatModel(name: "Mahesh Pela", status: "Flutter Developer"),
    ChatModel(name: "Tilak Joshi", status: "Dot Net Developer"),
    ChatModel(name: "Ashok Buda", status: "Dot Net Developer"),
  ];

  List<ChatModel> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Group",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              Text(
                "Add participants",
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        if (contacts[index].selected == false) {
                          setState(() {
                            contacts[index].selected = true;
                            groups.add(contacts[index]);
                          });
                        } else {
                          setState(() {
                            contacts[index].selected = false;
                            groups.remove(contacts[index]);
                          });
                        }
                      },
                      child: ContactCard(contacts: contacts[index]));
                }
                ),
            Column(
              children: [
                Container(
                  height: 75,
                  color: Colors.white,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: contacts.length,
                      itemBuilder: (context, index) => Avatarcard()
                  ),
                ),
                Divider(thickness: 1,)
              ],
            )
          ],
        ));
  }
}
