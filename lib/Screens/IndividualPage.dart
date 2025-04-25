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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 60,
                      child: Card(
                        margin: EdgeInsets.only(left: 5, right: 5, bottom: 8),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                          child: TextFormField(
                            maxLines: 5,
                            minLines: 1,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.grey)
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.grey.shade300)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.blue)
                              ),
                              hintText: "Enter your message",
                              prefixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.emoji_emotions)),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(onPressed: (){}, icon: Icon(Icons.attach_file)),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt))
                                ],
                              ),
                              contentPadding: EdgeInsets.all(5)
                            ),
                          ))),
                  Padding(
                    padding: const EdgeInsets.only(right: 2, left:5, bottom: 8),
                    child: CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: 25,
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.mic, color: Colors.white,)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
