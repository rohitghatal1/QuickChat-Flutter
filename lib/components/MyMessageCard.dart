import 'dart:ffi';

import 'package:flutter/material.dart';

class MyMessageCard extends StatelessWidget {
  const MyMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width - 45,
      ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          color: Colors.green.shade600,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 60, top: 5, bottom: 20),
                child: Text("Hello", style: TextStyle(
                  fontSize: 16
                ),),
              ),
              Positioned(
                right: 10,
                bottom: 4,
                child: Row(
                  children: [
                    Text("12: 50", style: TextStyle(fontSize: 13, color: Colors.grey),),
                    SizedBox(width: 5),
                    Icon(Icons.done_all, size: 30,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
