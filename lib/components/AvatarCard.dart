import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Avatarcard extends StatelessWidget {
  const Avatarcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 25,
                child: SvgPictureture.asset("assets/personIcon.svg",
                    color: Colors.white),
                backgroundColor: Colors.blueGrey.shade200,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 11,
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 13,
                    )),
              )
            ],
          ),
          SizedBox(height: 2),
          Text("name", style: TextStyle(fontSize: 12),),
        ],
      ),
    );
  }
}
