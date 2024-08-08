import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_front/shared/chat/Vertical_listview.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ChatState();
  }
}

class _ChatState extends State<Chat> {
  late StompClient client;

  List listMessages = [];
  TextEditingController controller = TextEditingController();

  @override
  @override
  void initState() {
    super.initState();
    client = StompClient(
        config: StompConfig(
            url: "ws://192.168.1.34:8080/wsflutter",
            onWebSocketError: (dynamic error) {
              print(error);
            },
            onConnect: onConnect));
    client.activate();
    sendUser();
  }

  sendUser() async {
    await Future.delayed(Duration(seconds: 1));
    client.send(
        destination: "/app/chat.addUser",
        body: jsonEncode({"sender": "web", "type": "JOIN"}));
  }

  @override
  void dispose() {
    client.deactivate();
    super.dispose();
  }

  void _addMessage(dynamic message) {
    setState(() {
      listMessages.add(message);
    });
  }

  void onConnect(StompFrame frame) {
    client.subscribe(
        destination: "/topic/public",
        callback: (StompFrame frame) {
          final body = json.decode(frame.body!);
          if (frame.body != null) {
            if (body["type"] == "CHAT") {
              print(body);
              _addMessage(body);
            }
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 30, 5, 0),
            child: VerticalListView(listMessages: listMessages),
          )),
          Padding(
              padding: const EdgeInsets.fromLTRB(20,0,20,0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                    ),
                  ),
                  Expanded(
                    flex: 0,
                      child: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      client.send(
                          destination: "/app/chat.sendMessage",
                          body: jsonEncode({
                            "sender": "web",
                            "content": controller.text,
                            "type": 'CHAT'
                          }));
                    },
                  )),
                ],
              )),
        ],
      ),
    ));
  }
}
