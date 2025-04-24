import 'package:firt_flutter_app/Model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Screens/IndividualPage.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => IndividualPage(chatModel: widget.chatModel,)));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                "assets/${widget.chatModel.icon}",
                width: 35,
                height: 35,
                color: Colors.white,
              ),

            ),
            title: Text(
              widget.chatModel.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 3,
                ),
                Text(
                  widget.chatModel.currentMessage,
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
            trailing: Text(widget.chatModel.time),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
