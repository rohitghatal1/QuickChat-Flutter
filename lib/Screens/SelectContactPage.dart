import 'package:firt_flutter_app/Model/ChatModel.dart';
import 'package:firt_flutter_app/Screens/CreateGroupPage.dart';
import 'package:firt_flutter_app/components/ButtonCard.dart';
import 'package:firt_flutter_app/components/ContactCard.dart';
import 'package:flutter/material.dart';

class SelectContactPage extends StatefulWidget {
  const SelectContactPage({super.key});

  @override
  State<SelectContactPage> createState() => _SelectContactPageState();
}

class _SelectContactPageState extends State<SelectContactPage> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(
          name: "Rohit Ghatal", status: "Frontend Developer"
      ),
      ChatModel(
          name: "Birendra Dhamii", status: "Backend Developer"
      ),
      ChatModel(
          name: "Mahesh Pela", status: "Flutter Developer"
      ),
      ChatModel(
          name: "Tilak Joshi", status: "Dot Net Developer"
      ),
      ChatModel(
          name: "Ashok Buda", status: "Dot Net Developer"
      ),
    ];
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
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            PopupMenuButton(itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text("Invite a friend"),
                  value: "Invite a friend",
                ),
                PopupMenuItem(
                  child: Text("Contacts"),
                  value: "Contacts",
                ),
                PopupMenuItem(
                  child: Text("Refresh"),
                  value: "Refresh",
                ),
                PopupMenuItem(
                  child: Text("Help"),
                  value: "Help",
                ),
              ];
            })
          ],
        ),
        body: ListView.builder(
            itemCount: contacts.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (builder) => CreateGroupPage()));
                    },
                    child: ButtonCard(
                        icon: Icons.group,
                        name: "New Group")
                );
              } else if (index == 1) {
                return ButtonCard(icon: Icons.person_add, name: "New Contact");
              }
              return ContactCard(contacts: contacts[index - 2]);
            }
        )
    );
  }
}
