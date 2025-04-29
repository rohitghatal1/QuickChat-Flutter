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
                itemCount: contacts.length + 1,
                itemBuilder: (context, index) {
                  if(index == 0){
                    return Container(
                      height: groups.length > 0 ? 90 : 10,
                    );
                  }
                  return InkWell(
                      onTap: () {
                        if (contacts[index - 1].selected == false) {
                          setState(() {
                            contacts[index- 1].selected = true;
                            groups.add(contacts[index - 1]);
                          });
                        } else {
                          setState(() {
                            contacts[index - 1].selected = false;
                            groups.remove(contacts[index - 1]);
                          });
                        }
                      },
                      child: ContactCard(contacts: contacts[index - 1]));
                }
            ),
            groups.length > 0 ? Column(
              children: [
                Container(
                  height: 75,
                  color: Colors.white,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: contacts.length,
                      itemBuilder: (context, index) {
                        if (contacts[index].selected == true) {
                          return InkWell(
                            onTap: (){
                              setState(() {
                                groups.remove(contacts[index]);
                                contacts[index].selected = false;
                              });
                            },
                            child: Avatarcard(
                                contact: contacts[index]
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }
                  ),
                ),
                Divider(thickness: 1,)
              ],
            ): Container(),
          ],
        ));
  }
}
