import 'package:flutter/material.dart';

class Mymessage extends StatelessWidget {
  const Mymessage({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(constraints: BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width - 45,
    ),
      child: Card(
        color: Colors.green.shade600,
      ),
    );
  }
}
