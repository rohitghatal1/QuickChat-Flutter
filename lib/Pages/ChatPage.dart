import 'package:flutter/material.dart';

import '../Model/ChatModel.dart';
import '../Screens/SelectContactPage.dart';
import '../components/customCard.dart';

class ChatPage extends StatefulWidget {
  ChatPage({ Key? key, this.chatmodels,  this.sourchat}) : super(key: key);
  final List<ChatModel>? chatmodels;
  final ChatModel? sourchat;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => SelectContact()));
        },
        child: Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
      body: widget.chatmodels == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: widget.chatmodels!.length,
        itemBuilder: (contex, index) => CustomCard(
          chatModel: widget.chatmodels![index],
          sourchat: widget.sourchat,
        ),
      ),
    );
  }
}
