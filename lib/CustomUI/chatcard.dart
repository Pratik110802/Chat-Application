import 'package:chat_app/Model/chatmodel.dart';
import 'package:chat_app/Screens/chatpage.dart';
import 'package:chat_app/constants/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatCard extends StatefulWidget {
  ChatCard(this.chat, {super.key});
  ChatModel chat;

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  bool showprofile = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => ChatPage(
                      chat: widget.chat,
                    ))));
      },
      child: Column(
        children: [
          ListTile(
            minVerticalPadding: 0,
            leading: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => SimpleDialog(
                    title: Text(widget.chat.name),
                    children: <Widget>[
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(widget.chat.image)),
                              borderRadius: BorderRadius.circular(20)),
                          height: 250,
                          width: 250,
                        ),
                      ),
                      SizedBox(
                        width: 210,
                        height: 50,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.message_rounded),
                                color: primaryColor,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.phone),
                                color: primaryColor,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.videocam),
                                color: primaryColor,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.info_outline),
                                color: primaryColor,
                              )
                            ]),
                      )
                    ],
                  ),
                );
              },
              child: Container(
                  height: 59,
                  width: 59,
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: CircleAvatar(
                      radius: 72.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(widget.chat.image))),
            ),
            title: Text(
              widget.chat.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                const Icon(
                  Icons.done_all,
                  size: 16,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(widget.chat.currentMessage),
              ],
            ),
            trailing: Text(widget.chat.time),
          ),
          const Divider()
        ],
      ),
    );
  }
}
