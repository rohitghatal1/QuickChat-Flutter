import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                "assets/groupIcon.svg",
                width: 35,
                height: 35,
                color: Colors.white,
              ),

            ),
            title: Text(
              "Rohit Ghatal",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "Hi roht how are you",
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
            trailing: Text("18:04"),
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
