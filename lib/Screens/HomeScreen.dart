import "package:firt_flutter_app/Pages/CameraPage.dart";
import "package:firt_flutter_app/Pages/ChatPage.dart";
import "package:flutter/material.dart";

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QuickChat"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
         PopupMenuButton<String>(
           onSelected: (value){
             print(value);
           },
             itemBuilder: (BuildContext context){
           return [
             PopupMenuItem(child: Text("New Group"), value: "New Group",),
             PopupMenuItem(child: Text("Starred Messages"), value: "Starred Messages",),
             PopupMenuItem(child: Text("Settings"), value: "Settings",),
           ];
         })
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "Chats",
            ),
            Tab(
              text: "Status",
            ),
            Tab(
              text: "Calls",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
          children: [
        CameraPage(),
        ChatPage(),
        Text("Status"),
        Text("Calls"),
      ]),
    );
  }
}
