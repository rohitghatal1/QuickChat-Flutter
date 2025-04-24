import 'package:firt_flutter_app/Model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 70,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back, size: 24,),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey,
                child: SvgPicture.asset(
                  widget.chatModel.isGroup? "assets/groupIcon.svg" : "assets/personIcon.svg",
                  color: Colors.white,
                  height: 36,
                  width: 36,
                ),
              )
            ],
          ),
        ),
        title: InkWell(
          onTap: (){},
          child: Container(
            margin: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.chatModel.name,
                  style: TextStyle(
                      fontSize: 18.5,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  widget.chatModel.time,
                  style: TextStyle(
                    fontSize: 13
                  ),
                )
              ],
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: (){}, icon: Icon(Icons.call)),
          PopupMenuButton(itemBuilder: (BuildContext context){
            return [
              PopupMenuItem(child: Text("New Group"), value: "New Group",),
              PopupMenuItem(child: Text("Starred Messages"), value: "Starred Messages",),
              PopupMenuItem(child: Text("Settings"), value: "Settings",),
            ];
          })
        ],
      ),
    );
  }
}
