
import 'package:chatapp/CustomUI/ReplyCard.dart';
import 'package:chatapp/Model/ChatModel.dart';
import 'package:chatapp/Model/MessageModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../CustomUI/OwnMessgaeCrad.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key, this.chatModel, this.sourchat}) : super(key: key);
  final ChatModel? chatModel;
  final ChatModel? sourchat;

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  bool sendButton = false;
  List<MessageModel> messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
    connect();
  }

  void connect() {
    socket = IO.io("http://192.168.0.106:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    if (widget.sourchat?.id != null) {
      socket.emit("signin", widget.sourchat!.id);
    }
    socket.onConnect((data) {
      print("Connected");
      socket.on("message", (msg) {
        print(msg);
        setMessage("destination", msg["message"]);
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    });
    print(socket.connected);
  }

  void sendMessage(String message, int sourceId, int targetId) {
    setMessage("source", message);
    socket.emit("message", {
      "message": message,
      "sourceId": sourceId,
      "targetId": targetId
    });
  }

  void setMessage(String type, String message) {
    final messageModel = MessageModel(
      type: type,
      message: message,
      time: DateTime.now().toString().substring(10, 16),
    );

    setState(() {
      messages.add(messageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    final chatModel = widget.chatModel;
    final sourchat = widget.sourchat;

    return Stack(
      children: [
        Image.asset(
          "assets/whatsapp_Back.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              leadingWidth: 70,
              titleSpacing: 0,
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.arrow_back, size: 24),
                    CircleAvatar(
                      child: SvgPicture.asset(
                        chatModel?.isGroup == true
                            ? "assets/groups.svg"
                            : "assets/person.svg",
                        color: Colors.white,
                        height: 36,
                        width: 36,
                      ),
                      radius: 20,
                      backgroundColor: Colors.blueGrey,
                    ),
                  ],
                ),
              ),
              title: InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chatModel?.name ?? "Unknown",
                        style: const TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "last seen today at 12:05",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: WillPopScope(
            onWillPop: () async {
              if (show) {
                setState(() => show = false);
              } else {
                Navigator.pop(context);
              }
              return false;
            },
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: messages.length + 1,
                    itemBuilder: (context, index) {
                      if (index == messages.length) {
                        return const SizedBox(height: 70);
                      }
                      final message = messages[index];
                      return message.type == "source"
                          ? OwnMessageCard(message: message.message, time: message.time)
                          : ReplyCard(message: message.message, time: message.time);
                    },
                  ),
                ),
                _buildMessageInput(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMessageInput() {
    final sourchat = widget.sourchat;
    final chatModel = widget.chatModel;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 70,
        child: Row(
          children: [
            Expanded(
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextFormField(
                  controller: _controller,
                  focusNode: focusNode,
                  maxLines: 5,
                  minLines: 1,
                  onChanged: (value) => setState(() => sendButton = value.isNotEmpty),
                  decoration: InputDecoration(
                    hintText: "Type a message",
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(5),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(sendButton ? Icons.send : Icons.mic),
              onPressed: sendButton && sourchat?.id != null && chatModel?.id != null
                  ? () {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
                if (sourchat?.id != null && chatModel?.id != null) {
                  sendMessage(_controller.text, sourchat!.id!, chatModel!.id!);
                  _controller.clear();
                  setState(() => sendButton = false);
                } else {
                  print("Either sourchat or chatModel id is null");
                }

              }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
