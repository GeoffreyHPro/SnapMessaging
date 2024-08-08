import 'package:flutter/material.dart';

class ChatElementListView extends StatelessWidget {
  final dynamic message;

  const ChatElementListView({Key? key, required this.message})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Message(message: message);
  }
}

class Message extends StatelessWidget {
  final dynamic message;

  Message({Key? key, this.message}) : super(key: key);

  dynamic tab1 = Text("");
  dynamic tab2 = Text("");

  getMesage() {
    if (message["sender"] == "flutter_user") {
      tab1 = IconButton(
        icon: const Icon(Icons.account_box_sharp),
        onPressed: () {},
      );
    }else{
      tab2 = IconButton(
        icon: const Icon(Icons.account_box_sharp),
        onPressed: () {},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    getMesage();
    return Row(
      children: [
        Expanded(flex: 1, child: tab1),
        Expanded(
            flex: 10,
            child: Container(
              width: 50,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(200, 200, 200, 0.2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  Text(message["sender"]),
                  Text(message["content"]),
                ],
              ),
            )),
        Expanded(child: tab2),
      ],
    );
  }
}
