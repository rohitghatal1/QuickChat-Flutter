import 'package:firt_flutter_app/Model/ChatModel.dart';
import 'package:firt_flutter_app/Screens/SelectContactPage.dart';
import 'package:firt_flutter_app/components/customCard.dart';
import 'package:flutter/material.dart';
import '';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> chats = [
      ChatModel(
        name: "Rohit Gahtal",
        isGroup: false,
        currentMessage: "Hi Rohit, how are you",
        time: "05:00",
        icon: "personIcon.svg",
      ),
      ChatModel(
        name: "Ram",
        isGroup: false,
        currentMessage: "What up bro",
        time: "02:00",
        icon: "personIcon.svg",
      ),
      ChatModel(
        name: "Hari",
        isGroup: false,
        currentMessage: "Kya haal hai",
        time: "02:15",
        icon: "personIcon.svg",
      ),
      ChatModel(
        name: "Shyam",
        isGroup: false,
        currentMessage: "Hi Rohit, how are you",
        time: "03:20",
        icon: "personIcon.svg",
      ),
    ];
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30.0, right: 20.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (builder) => SelectContactPage()));
          },
          child: Icon(Icons.chat),
        ),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(chatModel: chats[index]),
      ),
    );
  }
}
